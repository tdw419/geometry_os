; DESCRIPTION: Creates a orange rectangular region at (86, 185) spanning 54 by 64 pixels.
; PLAN: r0=86(x), r1=185(y), r2=54(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 185
LDI r2, 54
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
