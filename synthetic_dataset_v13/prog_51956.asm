; DESCRIPTION: Composite: Places a magenta line segment connecting (350, 83) to (459, 28) then Sets a single yellow pixel at (189, 12) then Places a cyan 55x27 rectangle at position (121, 100).
; PLAN: r0=350(x1), r1=83(y1), r2=459(x2), r3=28(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=189(x), r6=12(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=121(x), r11=100(y), r12=55(width), r13=27(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 350
LDI r1, 83
LDI r2, 459
LDI r3, 28
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 189
LDI r6, 12
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 121
LDI r11, 100
LDI r12, 55
LDI r13, 27
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
