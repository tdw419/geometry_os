; DESCRIPTION: Creates a orange rectangular region at (211, 192) spanning 98 by 64 pixels.
; PLAN: r0=211(x), r1=192(y), r2=98(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 192
LDI r2, 98
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
