; DESCRIPTION: Creates a cyan rectangular region at (256, 104) spanning 94 by 101 pixels.
; PLAN: r0=256(x), r1=104(y), r2=94(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 104
LDI r2, 94
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
