; DESCRIPTION: Composite: Draws a red circle centered at (36, 211) with radius 34 then Renders a green box of size 41x98 starting at (387, 2) then Renders a yellow line between points (252, 224) and (273, 83).
; PLAN: r0=36(x), r1=211(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=387(x), r6=2(y), r7=41(width), r8=98(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=252(x1), r11=224(y1), r12=273(x2), r13=83(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 36
LDI r1, 211
LDI r2, 34
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 387
LDI r6, 2
LDI r7, 41
LDI r8, 98
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 252
LDI r11, 224
LDI r12, 273
LDI r13, 83
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
