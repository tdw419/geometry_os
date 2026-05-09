; DESCRIPTION: Creates a orange rectangular region at (75, 22) spanning 93 by 49 pixels.
; PLAN: r0=75(x), r1=22(y), r2=93(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 22
LDI r2, 93
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
