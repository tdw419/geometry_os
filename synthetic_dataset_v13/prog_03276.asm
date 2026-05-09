; DESCRIPTION: Composite: Draws a green line from (381, 30) to (281, 164) then Places a blue 70x100 rectangle at position (129, 99) then Places a yellow dot at position (46, 60).
; PLAN: r0=381(x1), r1=30(y1), r2=281(x2), r3=164(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=129(x), r6=99(y), r7=70(width), r8=100(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=46(x), r11=60(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 381
LDI r1, 30
LDI r2, 281
LDI r3, 164
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 129
LDI r6, 99
LDI r7, 70
LDI r8, 100
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 46
LDI r11, 60
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
