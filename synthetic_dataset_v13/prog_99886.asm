; DESCRIPTION: Creates a red rectangular region at (207, 8) spanning 96 by 57 pixels.
; PLAN: r0=207(x), r1=8(y), r2=96(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 8
LDI r2, 96
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
