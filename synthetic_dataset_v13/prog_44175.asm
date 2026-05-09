; DESCRIPTION: Creates a red rectangular region at (153, 96) spanning 33 by 104 pixels.
; PLAN: r0=153(x), r1=96(y), r2=33(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 96
LDI r2, 33
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
