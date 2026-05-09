; DESCRIPTION: Creates a orange rectangular region at (176, 10) spanning 61 by 32 pixels.
; PLAN: r0=176(x), r1=10(y), r2=61(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 10
LDI r2, 61
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
