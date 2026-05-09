; DESCRIPTION: Composite: Places a yellow line segment connecting (386, 243) to (86, 220) then Draws a cyan rectangle at (214, 66) with width 99 and height 29 then Places a white dot at position (179, 102).
; PLAN: r0=386(x1), r1=243(y1), r2=86(x2), r3=220(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=214(x), r6=66(y), r7=99(width), r8=29(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=179(x), r11=102(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 386
LDI r1, 243
LDI r2, 86
LDI r3, 220
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 214
LDI r6, 66
LDI r7, 99
LDI r8, 29
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 179
LDI r11, 102
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
