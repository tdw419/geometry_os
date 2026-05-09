; DESCRIPTION: Creates a red rectangular region at (161, 17) spanning 104 by 48 pixels.
; PLAN: r0=161(x), r1=17(y), r2=104(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 17
LDI r2, 104
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
