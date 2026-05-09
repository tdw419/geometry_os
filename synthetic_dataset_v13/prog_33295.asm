; DESCRIPTION: Composite: Places a yellow line segment connecting (70, 75) to (154, 114) then Renders a magenta box of size 75x81 starting at (279, 101).
; PLAN: r0=70(x1), r1=75(y1), r2=154(x2), r3=114(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=279(x), r6=101(y), r7=75(width), r8=81(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 70
LDI r1, 75
LDI r2, 154
LDI r3, 114
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 279
LDI r6, 101
LDI r7, 75
LDI r8, 81
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
