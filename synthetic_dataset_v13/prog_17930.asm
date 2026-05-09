; DESCRIPTION: Draws a magenta line from (242, 224) to (397, 244).
; PLAN: r0=242(x1), r1=224(y1), r2=397(x2), r3=244(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 224
LDI r2, 397
LDI r3, 244
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
