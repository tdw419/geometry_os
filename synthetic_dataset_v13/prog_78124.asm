; DESCRIPTION: Creates a orange rectangular region at (176, 95) spanning 86 by 60 pixels.
; PLAN: r0=176(x), r1=95(y), r2=86(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 95
LDI r2, 86
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
