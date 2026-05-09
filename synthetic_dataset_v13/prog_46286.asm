; DESCRIPTION: Creates a blue rectangular region at (192, 173) spanning 60 by 21 pixels.
; PLAN: r0=192(x), r1=173(y), r2=60(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 173
LDI r2, 60
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
