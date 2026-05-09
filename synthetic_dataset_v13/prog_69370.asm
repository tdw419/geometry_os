; DESCRIPTION: Renders a magenta box of size 50x23 starting at (60, 60).
; PLAN: r0=60(x), r1=60(y), r2=50(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 60
LDI r2, 50
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
