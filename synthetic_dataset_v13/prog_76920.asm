; DESCRIPTION: Creates a yellow rectangular region at (63, 131) spanning 87 by 99 pixels.
; PLAN: r0=63(x), r1=131(y), r2=87(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 131
LDI r2, 87
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
