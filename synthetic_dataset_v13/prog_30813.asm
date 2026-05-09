; DESCRIPTION: Creates a orange rectangular region at (95, 175) spanning 85 by 47 pixels.
; PLAN: r0=95(x), r1=175(y), r2=85(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 175
LDI r2, 85
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
