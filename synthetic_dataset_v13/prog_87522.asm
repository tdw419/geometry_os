; DESCRIPTION: Composite: Sets a single purple pixel at (77, 16) then Places a yellow line segment connecting (369, 69) to (447, 212) then Places a green 53x96 rectangle at position (454, 32).
; PLAN: r0=77(x), r1=16(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=369(x1), r6=69(y1), r7=447(x2), r8=212(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=454(x), r11=32(y), r12=53(width), r13=96(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 77
LDI r1, 16
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 369
LDI r6, 69
LDI r7, 447
LDI r8, 212
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 454
LDI r11, 32
LDI r12, 53
LDI r13, 96
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
