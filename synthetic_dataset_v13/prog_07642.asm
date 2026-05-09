; DESCRIPTION: Creates a orange rectangular region at (220, 91) spanning 15 by 37 pixels.
; PLAN: r0=220(x), r1=91(y), r2=15(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 91
LDI r2, 15
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
