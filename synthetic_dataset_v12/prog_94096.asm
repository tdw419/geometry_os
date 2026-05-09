; DESCRIPTION: Creates a red rectangular region at (179, 198) spanning 84 by 57 pixels.
; PLAN: r0=179(x), r1=198(y), r2=84(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 198
LDI r2, 84
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
