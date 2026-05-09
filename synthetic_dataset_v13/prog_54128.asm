; DESCRIPTION: Creates a red rectangular region at (424, 104) spanning 28 by 82 pixels.
; PLAN: r0=424(x), r1=104(y), r2=28(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 104
LDI r2, 28
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
