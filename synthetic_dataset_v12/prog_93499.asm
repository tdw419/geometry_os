; DESCRIPTION: Renders a magenta box of size 73x75 starting at (340, 50).
; PLAN: r0=340(x), r1=50(y), r2=73(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 50
LDI r2, 73
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
