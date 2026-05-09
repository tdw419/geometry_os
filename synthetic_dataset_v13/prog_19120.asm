; DESCRIPTION: Composite: Draws a white line from (282, 28) to (319, 208) then Draws a white rectangle at (189, 100) with width 74 and height 88 then Sets a single cyan pixel at (242, 205).
; PLAN: r0=282(x1), r1=28(y1), r2=319(x2), r3=208(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=189(x), r6=100(y), r7=74(width), r8=88(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=242(x), r11=205(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 282
LDI r1, 28
LDI r2, 319
LDI r3, 208
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 189
LDI r6, 100
LDI r7, 74
LDI r8, 88
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 242
LDI r11, 205
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
