; DESCRIPTION: Creates a orange rectangular region at (179, 150) spanning 31 by 103 pixels.
; PLAN: r0=179(x), r1=150(y), r2=31(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 150
LDI r2, 31
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
