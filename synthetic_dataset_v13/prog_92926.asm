; DESCRIPTION: Renders a cyan line between points (352, 76) and (424, 223).
; PLAN: r0=352(x1), r1=76(y1), r2=424(x2), r3=223(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 76
LDI r2, 424
LDI r3, 223
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
