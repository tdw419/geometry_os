; DESCRIPTION: Draws a green line from (52, 197) to (350, 50).
; PLAN: r0=52(x1), r1=197(y1), r2=350(x2), r3=50(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 197
LDI r2, 350
LDI r3, 50
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
