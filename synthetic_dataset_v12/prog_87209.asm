; DESCRIPTION: Renders a magenta box of size 20x18 starting at (7, 150).
; PLAN: r0=7(x), r1=150(y), r2=20(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 150
LDI r2, 20
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
