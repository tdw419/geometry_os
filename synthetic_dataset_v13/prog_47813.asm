; DESCRIPTION: Creates a yellow rectangular region at (361, 143) spanning 63 by 26 pixels.
; PLAN: r0=361(x), r1=143(y), r2=63(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 143
LDI r2, 63
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
