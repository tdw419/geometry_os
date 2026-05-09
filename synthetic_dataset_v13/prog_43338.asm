; DESCRIPTION: Draws a green line from (354, 23) to (433, 175).
; PLAN: r0=354(x1), r1=23(y1), r2=433(x2), r3=175(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 23
LDI r2, 433
LDI r3, 175
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
