; DESCRIPTION: Composite: Places a cyan 89x71 rectangle at position (263, 144) then Places a magenta circle of radius 52 at center (268, 81) then Places a purple line segment connecting (440, 11) to (320, 53).
; PLAN: r0=263(x), r1=144(y), r2=89(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=268(x), r6=81(y), r7=52(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=440(x1), r11=11(y1), r12=320(x2), r13=53(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 263
LDI r1, 144
LDI r2, 89
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 268
LDI r6, 81
LDI r7, 52
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 440
LDI r11, 11
LDI r12, 320
LDI r13, 53
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
