; DESCRIPTION: Composite: Renders a orange box of size 84x61 starting at (187, 104) then Places a white circle of radius 70 at center (370, 153) then Draws a red line from (1, 50) to (412, 87).
; PLAN: r0=187(x), r1=104(y), r2=84(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=370(x), r6=153(y), r7=70(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=1(x1), r11=50(y1), r12=412(x2), r13=87(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 187
LDI r1, 104
LDI r2, 84
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 370
LDI r6, 153
LDI r7, 70
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 1
LDI r11, 50
LDI r12, 412
LDI r13, 87
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
