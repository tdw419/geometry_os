; DESCRIPTION: Creates a red rectangular region at (16, 50) spanning 118 by 70 pixels.
; PLAN: r0=16(x), r1=50(y), r2=118(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 50
LDI r2, 118
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
