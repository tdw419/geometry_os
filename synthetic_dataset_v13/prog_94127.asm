; DESCRIPTION: Composite: Renders a cyan line between points (351, 173) and (486, 13) then Renders a orange disk with center (424, 98) and radius 51 then Renders a yellow box of size 20x15 starting at (479, 83).
; PLAN: r0=351(x1), r1=173(y1), r2=486(x2), r3=13(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=424(x), r6=98(y), r7=51(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=479(x), r11=83(y), r12=20(width), r13=15(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 351
LDI r1, 173
LDI r2, 486
LDI r3, 13
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 424
LDI r6, 98
LDI r7, 51
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 479
LDI r11, 83
LDI r12, 20
LDI r13, 15
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
