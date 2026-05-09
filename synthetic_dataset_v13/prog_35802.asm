; DESCRIPTION: Creates a red rectangular region at (179, 94) spanning 70 by 99 pixels.
; PLAN: r0=179(x), r1=94(y), r2=70(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 94
LDI r2, 70
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
