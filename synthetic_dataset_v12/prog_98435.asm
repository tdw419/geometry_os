; DESCRIPTION: Creates a red rectangular region at (181, 40) spanning 104 by 12 pixels.
; PLAN: r0=181(x), r1=40(y), r2=104(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 40
LDI r2, 104
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
