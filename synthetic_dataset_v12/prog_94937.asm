; DESCRIPTION: Draws a magenta line from (284, 99) to (195, 176).
; PLAN: r0=284(x1), r1=99(y1), r2=195(x2), r3=176(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 99
LDI r2, 195
LDI r3, 176
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
