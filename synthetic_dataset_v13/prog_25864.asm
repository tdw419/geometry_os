; DESCRIPTION: Creates a red rectangular region at (101, 1) spanning 10 by 104 pixels.
; PLAN: r0=101(x), r1=1(y), r2=10(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 1
LDI r2, 10
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
