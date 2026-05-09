; DESCRIPTION: Renders a blue box of size 57x108 starting at (447, 54).
; PLAN: r0=447(x), r1=54(y), r2=57(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 54
LDI r2, 57
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
