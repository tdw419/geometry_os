; DESCRIPTION: Draws a yellow line from (376, 234) to (394, 64).
; PLAN: r0=376(x1), r1=234(y1), r2=394(x2), r3=64(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 234
LDI r2, 394
LDI r3, 64
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
