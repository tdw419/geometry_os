; DESCRIPTION: Creates a orange rectangular region at (156, 153) spanning 21 by 16 pixels.
; PLAN: r0=156(x), r1=153(y), r2=21(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 153
LDI r2, 21
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
