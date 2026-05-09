; DESCRIPTION: Draws a black line from (354, 130) to (178, 195).
; PLAN: r0=354(x1), r1=130(y1), r2=178(x2), r3=195(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 130
LDI r2, 178
LDI r3, 195
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
