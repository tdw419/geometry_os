; DESCRIPTION: Draws a yellow line from (354, 33) to (237, 254).
; PLAN: r0=354(x1), r1=33(y1), r2=237(x2), r3=254(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 33
LDI r2, 237
LDI r3, 254
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
