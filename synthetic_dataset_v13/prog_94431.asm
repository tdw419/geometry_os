; DESCRIPTION: Renders a magenta box of size 28x76 starting at (220, 20).
; PLAN: r0=220(x), r1=20(y), r2=28(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 20
LDI r2, 28
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
