; DESCRIPTION: Composite: Renders a cyan box of size 42x69 starting at (276, 179) then Renders a green disk with center (75, 215) and radius 22 then Places a red line segment connecting (459, 59) to (151, 249).
; PLAN: r0=276(x), r1=179(y), r2=42(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=75(x), r6=215(y), r7=22(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=459(x1), r11=59(y1), r12=151(x2), r13=249(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 276
LDI r1, 179
LDI r2, 42
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 75
LDI r6, 215
LDI r7, 22
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 459
LDI r11, 59
LDI r12, 151
LDI r13, 249
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
