; DESCRIPTION: Composite: Creates a green circular shape at (370, 146) with radius 67 then Renders a cyan line between points (41, 41) and (480, 128) then Creates a red rectangular region at (6, 137) spanning 69 by 69 pixels.
; PLAN: r0=370(x), r1=146(y), r2=67(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=41(x1), r6=41(y1), r7=480(x2), r8=128(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=6(x), r11=137(y), r12=69(width), r13=69(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 370
LDI r1, 146
LDI r2, 67
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 41
LDI r6, 41
LDI r7, 480
LDI r8, 128
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 6
LDI r11, 137
LDI r12, 69
LDI r13, 69
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
