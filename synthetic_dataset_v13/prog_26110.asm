; DESCRIPTION: Creates a cyan rectangular region at (155, 222) spanning 28 by 20 pixels.
; PLAN: r0=155(x), r1=222(y), r2=28(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 222
LDI r2, 28
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
