; DESCRIPTION: Composite: Draws a cyan rectangle at (323, 12) with width 98 and height 39 then Places a white circle of radius 57 at center (425, 62) then Renders a orange line between points (446, 100) and (336, 202).
; PLAN: r0=323(x), r1=12(y), r2=98(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=425(x), r6=62(y), r7=57(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=446(x1), r11=100(y1), r12=336(x2), r13=202(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 323
LDI r1, 12
LDI r2, 98
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 425
LDI r6, 62
LDI r7, 57
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 446
LDI r11, 100
LDI r12, 336
LDI r13, 202
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
