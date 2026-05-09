; DESCRIPTION: Composite: Renders a green box of size 43x113 starting at (92, 11) then Renders a magenta line between points (95, 179) and (350, 64).
; PLAN: r0=92(x), r1=11(y), r2=43(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=95(x1), r6=179(y1), r7=350(x2), r8=64(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 92
LDI r1, 11
LDI r2, 43
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 179
LDI r7, 350
LDI r8, 64
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
