; DESCRIPTION: Draws a black line from (331, 27) to (350, 87).
; PLAN: r0=331(x1), r1=27(y1), r2=350(x2), r3=87(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 27
LDI r2, 350
LDI r3, 87
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
