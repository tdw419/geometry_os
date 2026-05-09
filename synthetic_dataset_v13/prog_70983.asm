; DESCRIPTION: Composite: Renders a green line between points (154, 41) and (130, 50) then Draws a black rectangle at (109, 30) with width 58 and height 11 then Places a magenta dot at position (142, 255).
; PLAN: r0=154(x1), r1=41(y1), r2=130(x2), r3=50(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=109(x), r6=30(y), r7=58(width), r8=11(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=142(x), r11=255(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 154
LDI r1, 41
LDI r2, 130
LDI r3, 50
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 109
LDI r6, 30
LDI r7, 58
LDI r8, 11
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 142
LDI r11, 255
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
