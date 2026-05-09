; DESCRIPTION: Creates a orange rectangular region at (32, 36) spanning 118 by 103 pixels.
; PLAN: r0=32(x), r1=36(y), r2=118(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 36
LDI r2, 118
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
