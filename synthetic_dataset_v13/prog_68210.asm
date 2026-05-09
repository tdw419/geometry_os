; DESCRIPTION: Creates a cyan rectangular region at (205, 130) spanning 94 by 32 pixels.
; PLAN: r0=205(x), r1=130(y), r2=94(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 130
LDI r2, 94
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
