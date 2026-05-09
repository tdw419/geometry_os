; DESCRIPTION: Composite: Places a magenta line segment connecting (279, 39) to (496, 240) then Renders a cyan box of size 35x109 starting at (370, 141).
; PLAN: r0=279(x1), r1=39(y1), r2=496(x2), r3=240(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=370(x), r6=141(y), r7=35(width), r8=109(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 279
LDI r1, 39
LDI r2, 496
LDI r3, 240
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 370
LDI r6, 141
LDI r7, 35
LDI r8, 109
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
