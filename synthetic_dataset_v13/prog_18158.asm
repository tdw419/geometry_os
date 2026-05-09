; DESCRIPTION: Draws a green line from (144, 167) to (367, 150).
; PLAN: r0=144(x1), r1=167(y1), r2=367(x2), r3=150(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 167
LDI r2, 367
LDI r3, 150
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
