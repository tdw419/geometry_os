; DESCRIPTION: Renders a magenta box of size 50x32 starting at (270, 137).
; PLAN: r0=270(x), r1=137(y), r2=50(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 137
LDI r2, 50
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
