; DESCRIPTION: Creates a red rectangular region at (260, 149) spanning 78 by 53 pixels.
; PLAN: r0=260(x), r1=149(y), r2=78(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 149
LDI r2, 78
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
