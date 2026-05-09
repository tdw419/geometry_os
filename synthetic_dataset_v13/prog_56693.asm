; DESCRIPTION: Creates a orange rectangular region at (95, 149) spanning 66 by 19 pixels.
; PLAN: r0=95(x), r1=149(y), r2=66(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 149
LDI r2, 66
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
