; DESCRIPTION: Creates a yellow rectangular region at (376, 54) spanning 80 by 64 pixels.
; PLAN: r0=376(x), r1=54(y), r2=80(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 54
LDI r2, 80
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
