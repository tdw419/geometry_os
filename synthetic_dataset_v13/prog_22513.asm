; DESCRIPTION: Creates a blue rectangular region at (202, 192) spanning 75 by 21 pixels.
; PLAN: r0=202(x), r1=192(y), r2=75(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 192
LDI r2, 75
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
