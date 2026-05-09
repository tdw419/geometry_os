; DESCRIPTION: Composite: Places a yellow 71x17 rectangle at position (398, 150) then Creates a white circular shape at (249, 89) with radius 50 then Places a cyan line segment connecting (432, 214) to (115, 71).
; PLAN: r0=398(x), r1=150(y), r2=71(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=249(x), r6=89(y), r7=50(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=432(x1), r11=214(y1), r12=115(x2), r13=71(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 398
LDI r1, 150
LDI r2, 71
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 249
LDI r6, 89
LDI r7, 50
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 432
LDI r11, 214
LDI r12, 115
LDI r13, 71
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
