; DESCRIPTION: Renders a blue box of size 37x86 starting at (351, 57).
; PLAN: r0=351(x), r1=57(y), r2=37(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 57
LDI r2, 37
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
