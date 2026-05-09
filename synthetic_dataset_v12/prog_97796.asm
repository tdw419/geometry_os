; DESCRIPTION: Renders a magenta box of size 44x68 starting at (311, 154).
; PLAN: r0=311(x), r1=154(y), r2=44(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 154
LDI r2, 44
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
