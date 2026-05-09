; DESCRIPTION: Creates a red rectangular region at (118, 154) spanning 91 by 96 pixels.
; PLAN: r0=118(x), r1=154(y), r2=91(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 154
LDI r2, 91
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
