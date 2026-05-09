; DESCRIPTION: Renders a purple box of size 56x86 starting at (63, 58).
; PLAN: r0=63(x), r1=58(y), r2=56(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 58
LDI r2, 56
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
