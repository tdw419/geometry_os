; DESCRIPTION: Creates a red rectangular region at (207, 163) spanning 22 by 74 pixels.
; PLAN: r0=207(x), r1=163(y), r2=22(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 163
LDI r2, 22
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
