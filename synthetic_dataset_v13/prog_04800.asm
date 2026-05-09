; DESCRIPTION: Renders a blue box of size 50x108 starting at (354, 86).
; PLAN: r0=354(x), r1=86(y), r2=50(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 86
LDI r2, 50
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
