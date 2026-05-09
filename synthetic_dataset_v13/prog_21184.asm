; DESCRIPTION: Composite: Renders a magenta box of size 79x67 starting at (64, 167) then Places a cyan line segment connecting (189, 100) to (175, 127).
; PLAN: r0=64(x), r1=167(y), r2=79(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=189(x1), r6=100(y1), r7=175(x2), r8=127(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 64
LDI r1, 167
LDI r2, 79
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 189
LDI r6, 100
LDI r7, 175
LDI r8, 127
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
