; DESCRIPTION: Creates a green rectangular region at (448, 39) spanning 64 by 104 pixels.
; PLAN: r0=448(x), r1=39(y), r2=64(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 39
LDI r2, 64
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
