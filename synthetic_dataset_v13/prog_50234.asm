; DESCRIPTION: Creates a red rectangular region at (280, 113) spanning 49 by 104 pixels.
; PLAN: r0=280(x), r1=113(y), r2=49(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 113
LDI r2, 49
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
