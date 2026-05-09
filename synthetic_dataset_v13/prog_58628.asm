; DESCRIPTION: Composite: Places a cyan circle of radius 75 at center (370, 173) then Places a yellow line segment connecting (103, 89) to (63, 46) then Places a red 16x51 rectangle at position (150, 41).
; PLAN: r0=370(x), r1=173(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=103(x1), r6=89(y1), r7=63(x2), r8=46(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=150(x), r11=41(y), r12=16(width), r13=51(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 370
LDI r1, 173
LDI r2, 75
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 103
LDI r6, 89
LDI r7, 63
LDI r8, 46
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 150
LDI r11, 41
LDI r12, 16
LDI r13, 51
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
