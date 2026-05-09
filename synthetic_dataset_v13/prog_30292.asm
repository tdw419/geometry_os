; DESCRIPTION: Composite: Sets a single black pixel at (152, 253) then Places a yellow line segment connecting (202, 19) to (305, 88) then Places a purple 35x52 rectangle at position (412, 106).
; PLAN: r0=152(x), r1=253(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=202(x1), r6=19(y1), r7=305(x2), r8=88(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=412(x), r11=106(y), r12=35(width), r13=52(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 152
LDI r1, 253
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 202
LDI r6, 19
LDI r7, 305
LDI r8, 88
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 412
LDI r11, 106
LDI r12, 35
LDI r13, 52
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
