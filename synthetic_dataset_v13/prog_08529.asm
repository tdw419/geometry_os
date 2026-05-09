; DESCRIPTION: Renders a cyan line between points (249, 222) and (167, 105).
; PLAN: r0=249(x1), r1=222(y1), r2=167(x2), r3=105(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 222
LDI r2, 167
LDI r3, 105
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
