; DESCRIPTION: Renders a magenta box of size 118x14 starting at (255, 154).
; PLAN: r0=255(x), r1=154(y), r2=118(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 154
LDI r2, 118
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
