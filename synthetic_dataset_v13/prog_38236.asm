; DESCRIPTION: Renders a cyan line between points (112, 219) and (162, 52).
; PLAN: r0=112(x1), r1=219(y1), r2=162(x2), r3=52(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 219
LDI r2, 162
LDI r3, 52
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
