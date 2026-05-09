; DESCRIPTION: Creates a red rectangular region at (59, 147) spanning 53 by 104 pixels.
; PLAN: r0=59(x), r1=147(y), r2=53(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 147
LDI r2, 53
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
