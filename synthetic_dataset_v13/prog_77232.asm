; DESCRIPTION: Creates a blue rectangular region at (70, 128) spanning 109 by 44 pixels.
; PLAN: r0=70(x), r1=128(y), r2=109(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 128
LDI r2, 109
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
