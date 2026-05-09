; DESCRIPTION: Composite: Places a green line segment connecting (384, 7) to (468, 117) then Creates a magenta rectangular region at (312, 210) spanning 51 by 21 pixels.
; PLAN: r0=384(x1), r1=7(y1), r2=468(x2), r3=117(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=312(x), r6=210(y), r7=51(width), r8=21(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 384
LDI r1, 7
LDI r2, 468
LDI r3, 117
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 210
LDI r7, 51
LDI r8, 21
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
