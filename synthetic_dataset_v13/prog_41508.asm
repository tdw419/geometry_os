; DESCRIPTION: Composite: Creates a orange circular shape at (352, 121) with radius 46 then Renders a white box of size 35x31 starting at (94, 18) then Draws a cyan line from (510, 240) to (435, 162).
; PLAN: r0=352(x), r1=121(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=94(x), r6=18(y), r7=35(width), r8=31(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=510(x1), r11=240(y1), r12=435(x2), r13=162(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 352
LDI r1, 121
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 94
LDI r6, 18
LDI r7, 35
LDI r8, 31
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 510
LDI r11, 240
LDI r12, 435
LDI r13, 162
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
