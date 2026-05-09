; DESCRIPTION: Composite: Places a magenta line segment connecting (121, 131) to (420, 196) then Creates a cyan rectangular region at (468, 54) spanning 15 by 36 pixels.
; PLAN: r0=121(x1), r1=131(y1), r2=420(x2), r3=196(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=468(x), r6=54(y), r7=15(width), r8=36(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 121
LDI r1, 131
LDI r2, 420
LDI r3, 196
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 468
LDI r6, 54
LDI r7, 15
LDI r8, 36
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
