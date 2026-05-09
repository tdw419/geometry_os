; DESCRIPTION: Creates a red rectangular region at (220, 127) spanning 101 by 88 pixels.
; PLAN: r0=220(x), r1=127(y), r2=101(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 127
LDI r2, 101
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
