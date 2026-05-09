; DESCRIPTION: Creates a red rectangular region at (91, 13) spanning 65 by 116 pixels.
; PLAN: r0=91(x), r1=13(y), r2=65(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 13
LDI r2, 65
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
