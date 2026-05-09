; DESCRIPTION: Creates a orange rectangular region at (341, 213) spanning 16 by 24 pixels.
; PLAN: r0=341(x), r1=213(y), r2=16(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 213
LDI r2, 16
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
