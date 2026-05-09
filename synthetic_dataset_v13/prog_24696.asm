; DESCRIPTION: Creates a cyan rectangular region at (72, 136) spanning 110 by 111 pixels.
; PLAN: r0=72(x), r1=136(y), r2=110(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 136
LDI r2, 110
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
