; DESCRIPTION: Creates a green rectangular region at (104, 5) spanning 82 by 24 pixels.
; PLAN: r0=104(x), r1=5(y), r2=82(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 5
LDI r2, 82
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
