; DESCRIPTION: Renders a purple box of size 32x108 starting at (335, 14).
; PLAN: r0=335(x), r1=14(y), r2=32(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 14
LDI r2, 32
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
