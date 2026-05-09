; DESCRIPTION: Renders a black line between points (63, 183) and (254, 213).
; PLAN: r0=63(x1), r1=183(y1), r2=254(x2), r3=213(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 183
LDI r2, 254
LDI r3, 213
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
