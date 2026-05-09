; DESCRIPTION: Creates a cyan rectangular region at (155, 64) spanning 29 by 104 pixels.
; PLAN: r0=155(x), r1=64(y), r2=29(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 64
LDI r2, 29
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
