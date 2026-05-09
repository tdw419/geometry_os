; DESCRIPTION: Creates a red rectangular region at (376, 63) spanning 83 by 63 pixels.
; PLAN: r0=376(x), r1=63(y), r2=83(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 63
LDI r2, 83
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
