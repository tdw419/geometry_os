; DESCRIPTION: Creates a orange rectangular region at (245, 160) spanning 13 by 32 pixels.
; PLAN: r0=245(x), r1=160(y), r2=13(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 160
LDI r2, 13
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
