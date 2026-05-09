; DESCRIPTION: Renders a magenta line between points (254, 76) and (43, 213).
; PLAN: r0=254(x1), r1=76(y1), r2=43(x2), r3=213(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 76
LDI r2, 43
LDI r3, 213
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
