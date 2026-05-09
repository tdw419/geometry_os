; DESCRIPTION: Creates a green rectangular region at (309, 68) spanning 103 by 116 pixels.
; PLAN: r0=309(x), r1=68(y), r2=103(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 68
LDI r2, 103
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
