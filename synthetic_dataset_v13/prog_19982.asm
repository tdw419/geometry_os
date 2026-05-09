; DESCRIPTION: Draws a black line from (224, 197) to (422, 230).
; PLAN: r0=224(x1), r1=197(y1), r2=422(x2), r3=230(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 197
LDI r2, 422
LDI r3, 230
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
