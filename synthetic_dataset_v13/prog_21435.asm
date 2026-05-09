; DESCRIPTION: Creates a yellow rectangular region at (156, 85) spanning 103 by 16 pixels.
; PLAN: r0=156(x), r1=85(y), r2=103(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 85
LDI r2, 103
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
