; DESCRIPTION: Creates a red rectangular region at (107, 20) spanning 16 by 119 pixels.
; PLAN: r0=107(x), r1=20(y), r2=16(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 20
LDI r2, 16
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
