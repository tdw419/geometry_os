; DESCRIPTION: Creates a orange rectangular region at (228, 31) spanning 32 by 33 pixels.
; PLAN: r0=228(x), r1=31(y), r2=32(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 31
LDI r2, 32
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
