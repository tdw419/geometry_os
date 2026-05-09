; DESCRIPTION: Composite: Sets a single white pixel at (46, 164) then Places a orange 75x72 rectangle at position (424, 21) then Draws a yellow line from (161, 129) to (453, 70).
; PLAN: r0=46(x), r1=164(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=424(x), r6=21(y), r7=75(width), r8=72(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=161(x1), r11=129(y1), r12=453(x2), r13=70(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 46
LDI r1, 164
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 424
LDI r6, 21
LDI r7, 75
LDI r8, 72
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 161
LDI r11, 129
LDI r12, 453
LDI r13, 70
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
