; DESCRIPTION: Renders a cyan line between points (352, 105) and (313, 55).
; PLAN: r0=352(x1), r1=105(y1), r2=313(x2), r3=55(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 105
LDI r2, 313
LDI r3, 55
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
