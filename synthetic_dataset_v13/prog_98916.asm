; DESCRIPTION: Creates a orange rectangular region at (256, 13) spanning 68 by 112 pixels.
; PLAN: r0=256(x), r1=13(y), r2=68(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 13
LDI r2, 68
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
