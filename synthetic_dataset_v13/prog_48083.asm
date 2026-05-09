; DESCRIPTION: Draws a yellow line from (224, 206) to (506, 50).
; PLAN: r0=224(x1), r1=206(y1), r2=506(x2), r3=50(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 206
LDI r2, 506
LDI r3, 50
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
