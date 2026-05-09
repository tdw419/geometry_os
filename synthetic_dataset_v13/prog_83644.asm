; DESCRIPTION: Renders a black line between points (375, 86) and (271, 173).
; PLAN: r0=375(x1), r1=86(y1), r2=271(x2), r3=173(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 86
LDI r2, 271
LDI r3, 173
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
