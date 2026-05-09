; DESCRIPTION: Creates a orange rectangular region at (115, 208) spanning 53 by 39 pixels.
; PLAN: r0=115(x), r1=208(y), r2=53(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 208
LDI r2, 53
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
