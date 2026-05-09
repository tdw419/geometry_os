; DESCRIPTION: Creates a red rectangular region at (179, 134) spanning 104 by 97 pixels.
; PLAN: r0=179(x), r1=134(y), r2=104(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 134
LDI r2, 104
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
