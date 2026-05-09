; DESCRIPTION: Creates a red rectangular region at (118, 118) spanning 104 by 70 pixels.
; PLAN: r0=118(x), r1=118(y), r2=104(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 118
LDI r2, 104
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
