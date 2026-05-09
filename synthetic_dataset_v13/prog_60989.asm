; DESCRIPTION: Renders a cyan line between points (360, 137) and (352, 171).
; PLAN: r0=360(x1), r1=137(y1), r2=352(x2), r3=171(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 137
LDI r2, 352
LDI r3, 171
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
