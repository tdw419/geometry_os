; DESCRIPTION: Renders a purple box of size 84x90 starting at (280, 32).
; PLAN: r0=280(x), r1=32(y), r2=84(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 32
LDI r2, 84
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
