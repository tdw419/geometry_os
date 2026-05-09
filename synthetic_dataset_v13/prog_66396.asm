; DESCRIPTION: Creates a orange rectangular region at (268, 94) spanning 64 by 86 pixels.
; PLAN: r0=268(x), r1=94(y), r2=64(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 94
LDI r2, 64
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
