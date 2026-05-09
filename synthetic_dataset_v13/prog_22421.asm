; DESCRIPTION: Creates a orange rectangular region at (300, 151) spanning 78 by 54 pixels.
; PLAN: r0=300(x), r1=151(y), r2=78(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 151
LDI r2, 78
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
