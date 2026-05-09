; DESCRIPTION: Creates a red rectangular region at (277, 159) spanning 88 by 84 pixels.
; PLAN: r0=277(x), r1=159(y), r2=88(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 159
LDI r2, 88
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
