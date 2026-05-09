; DESCRIPTION: Creates a orange rectangular region at (294, 66) spanning 26 by 94 pixels.
; PLAN: r0=294(x), r1=66(y), r2=26(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 66
LDI r2, 26
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
