; DESCRIPTION: Renders a magenta box of size 86x60 starting at (86, 159).
; PLAN: r0=86(x), r1=159(y), r2=86(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 159
LDI r2, 86
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
