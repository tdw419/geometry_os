; DESCRIPTION: Composite: Places a green circle of radius 57 at center (313, 147) then Renders a magenta box of size 10x75 starting at (455, 1).
; PLAN: r0=313(x), r1=147(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=455(x), r6=1(y), r7=10(width), r8=75(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 313
LDI r1, 147
LDI r2, 57
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 455
LDI r6, 1
LDI r7, 10
LDI r8, 75
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
