; DESCRIPTION: Creates a black rectangular region at (57, 32) spanning 104 by 80 pixels.
; PLAN: r0=57(x), r1=32(y), r2=104(width), r3=80(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 32
LDI r2, 104
LDI r3, 80
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
