; DESCRIPTION: Composite: Sets a single cyan pixel at (242, 154) then Draws a yellow rectangle at (339, 69) with width 119 and height 21 then Draws a yellow line from (62, 254) to (12, 234).
; PLAN: r0=242(x), r1=154(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=339(x), r6=69(y), r7=119(width), r8=21(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=62(x1), r11=254(y1), r12=12(x2), r13=234(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 242
LDI r1, 154
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 339
LDI r6, 69
LDI r7, 119
LDI r8, 21
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 62
LDI r11, 254
LDI r12, 12
LDI r13, 234
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
