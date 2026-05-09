; DESCRIPTION: Draws a magenta line from (320, 224) to (82, 160).
; PLAN: r0=320(x1), r1=224(y1), r2=82(x2), r3=160(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 224
LDI r2, 82
LDI r3, 160
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
