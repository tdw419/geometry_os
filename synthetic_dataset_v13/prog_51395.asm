; DESCRIPTION: Creates a orange rectangular region at (209, 9) spanning 113 by 14 pixels.
; PLAN: r0=209(x), r1=9(y), r2=113(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 9
LDI r2, 113
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
