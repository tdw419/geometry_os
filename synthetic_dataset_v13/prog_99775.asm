; DESCRIPTION: Draws a green line from (450, 84) to (354, 11).
; PLAN: r0=450(x1), r1=84(y1), r2=354(x2), r3=11(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 84
LDI r2, 354
LDI r3, 11
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
