; DESCRIPTION: Draws a magenta line from (294, 64) to (356, 62).
; PLAN: r0=294(x1), r1=64(y1), r2=356(x2), r3=62(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 64
LDI r2, 356
LDI r3, 62
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
