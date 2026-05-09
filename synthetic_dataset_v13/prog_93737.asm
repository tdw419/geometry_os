; DESCRIPTION: Creates a black rectangular region at (246, 104) spanning 42 by 113 pixels.
; PLAN: r0=246(x), r1=104(y), r2=42(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 104
LDI r2, 42
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
