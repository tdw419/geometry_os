; DESCRIPTION: Creates a magenta rectangular region at (296, 32) spanning 119 by 104 pixels.
; PLAN: r0=296(x), r1=32(y), r2=119(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 32
LDI r2, 119
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
