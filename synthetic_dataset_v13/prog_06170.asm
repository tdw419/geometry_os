; DESCRIPTION: Composite: Renders a cyan box of size 68x75 starting at (0, 44) then Renders a yellow line between points (368, 99) and (159, 105) then Places a yellow dot at position (5, 220).
; PLAN: r0=0(x), r1=44(y), r2=68(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=368(x1), r6=99(y1), r7=159(x2), r8=105(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=5(x), r11=220(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 0
LDI r1, 44
LDI r2, 68
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 99
LDI r7, 159
LDI r8, 105
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 5
LDI r11, 220
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
