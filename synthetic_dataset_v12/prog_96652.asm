; DESCRIPTION: Creates a orange rectangular region at (249, 71) spanning 37 by 28 pixels.
; PLAN: r0=249(x), r1=71(y), r2=37(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 71
LDI r2, 37
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
