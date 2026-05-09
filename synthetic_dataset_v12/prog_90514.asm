; DESCRIPTION: Composite: Places a purple line segment connecting (15, 210) to (35, 253) then Places a cyan circle of radius 72 at center (120, 124) then Places a orange 95x80 rectangle at position (307, 27).
; PLAN: r0=15(x1), r1=210(y1), r2=35(x2), r3=253(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=120(x), r6=124(y), r7=72(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=307(x), r11=27(y), r12=95(width), r13=80(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 15
LDI r1, 210
LDI r2, 35
LDI r3, 253
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 120
LDI r6, 124
LDI r7, 72
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 307
LDI r11, 27
LDI r12, 95
LDI r13, 80
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
