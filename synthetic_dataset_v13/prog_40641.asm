; DESCRIPTION: Composite: Creates a magenta circular shape at (335, 74) with radius 73 then Places a blue line segment connecting (307, 48) to (167, 81) then Places a cyan 92x92 rectangle at position (158, 162).
; PLAN: r0=335(x), r1=74(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=307(x1), r6=48(y1), r7=167(x2), r8=81(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=158(x), r11=162(y), r12=92(width), r13=92(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 335
LDI r1, 74
LDI r2, 73
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 307
LDI r6, 48
LDI r7, 167
LDI r8, 81
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 158
LDI r11, 162
LDI r12, 92
LDI r13, 92
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
