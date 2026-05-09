; DESCRIPTION: Draws a white line from (418, 32) to (485, 87).
; PLAN: r0=418(x1), r1=32(y1), r2=485(x2), r3=87(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 32
LDI r2, 485
LDI r3, 87
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
