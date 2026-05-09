; DESCRIPTION: Creates a purple rectangular region at (187, 224) spanning 94 by 32 pixels.
; PLAN: r0=187(x), r1=224(y), r2=94(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 224
LDI r2, 94
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
