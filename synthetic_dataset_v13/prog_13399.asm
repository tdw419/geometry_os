; DESCRIPTION: Renders a blue box of size 84x61 starting at (224, 182).
; PLAN: r0=224(x), r1=182(y), r2=84(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 182
LDI r2, 84
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
