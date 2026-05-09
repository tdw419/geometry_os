; DESCRIPTION: Creates a green rectangular region at (104, 39) spanning 64 by 31 pixels.
; PLAN: r0=104(x), r1=39(y), r2=64(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 39
LDI r2, 64
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
