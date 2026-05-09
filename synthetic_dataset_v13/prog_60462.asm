; DESCRIPTION: Renders a green line between points (499, 7) and (3, 167).
; PLAN: r0=499(x1), r1=7(y1), r2=3(x2), r3=167(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 7
LDI r2, 3
LDI r3, 167
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
