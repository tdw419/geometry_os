; DESCRIPTION: Renders a magenta box of size 70x27 starting at (53, 150).
; PLAN: r0=53(x), r1=150(y), r2=70(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 150
LDI r2, 70
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
