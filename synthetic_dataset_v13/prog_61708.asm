; DESCRIPTION: Renders a magenta box of size 17x120 starting at (385, 65).
; PLAN: r0=385(x), r1=65(y), r2=17(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 65
LDI r2, 17
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
