; DESCRIPTION: Draws a green line from (367, 191) to (256, 219).
; PLAN: r0=367(x1), r1=191(y1), r2=256(x2), r3=219(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 191
LDI r2, 256
LDI r3, 219
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
