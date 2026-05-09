; DESCRIPTION: Creates a orange rectangular region at (445, 165) spanning 13 by 52 pixels.
; PLAN: r0=445(x), r1=165(y), r2=13(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 165
LDI r2, 13
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
