; DESCRIPTION: Renders a magenta box of size 35x21 starting at (264, 150).
; PLAN: r0=264(x), r1=150(y), r2=35(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 150
LDI r2, 35
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
