; DESCRIPTION: Creates a orange rectangular region at (17, 193) spanning 64 by 32 pixels.
; PLAN: r0=17(x), r1=193(y), r2=64(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 193
LDI r2, 64
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
