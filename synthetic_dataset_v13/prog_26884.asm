; DESCRIPTION: Creates a orange rectangular region at (179, 25) spanning 70 by 53 pixels.
; PLAN: r0=179(x), r1=25(y), r2=70(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 25
LDI r2, 70
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
