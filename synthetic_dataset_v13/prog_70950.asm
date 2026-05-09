; DESCRIPTION: Composite: Places a white line segment connecting (128, 153) to (414, 160) then Sets a single black pixel at (38, 20) then Places a cyan 47x80 rectangle at position (209, 103).
; PLAN: r0=128(x1), r1=153(y1), r2=414(x2), r3=160(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=38(x), r6=20(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=209(x), r11=103(y), r12=47(width), r13=80(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 128
LDI r1, 153
LDI r2, 414
LDI r3, 160
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 38
LDI r6, 20
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 209
LDI r11, 103
LDI r12, 47
LDI r13, 80
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
