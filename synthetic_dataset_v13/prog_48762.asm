; DESCRIPTION: Creates a orange rectangular region at (268, 135) spanning 36 by 68 pixels.
; PLAN: r0=268(x), r1=135(y), r2=36(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 135
LDI r2, 36
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
