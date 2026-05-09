; DESCRIPTION: Creates a red rectangular region at (179, 113) spanning 95 by 70 pixels.
; PLAN: r0=179(x), r1=113(y), r2=95(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 113
LDI r2, 95
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
