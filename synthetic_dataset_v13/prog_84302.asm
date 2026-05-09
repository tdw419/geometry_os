; DESCRIPTION: Creates a orange rectangular region at (207, 99) spanning 63 by 94 pixels.
; PLAN: r0=207(x), r1=99(y), r2=63(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 99
LDI r2, 63
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
