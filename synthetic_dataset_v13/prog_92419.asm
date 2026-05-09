; DESCRIPTION: Composite: Renders a cyan line between points (155, 108) and (145, 249) then Renders a orange disk with center (233, 37) and radius 34 then Places a yellow 38x73 rectangle at position (241, 57).
; PLAN: r0=155(x1), r1=108(y1), r2=145(x2), r3=249(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=233(x), r6=37(y), r7=34(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=241(x), r11=57(y), r12=38(width), r13=73(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 155
LDI r1, 108
LDI r2, 145
LDI r3, 249
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 233
LDI r6, 37
LDI r7, 34
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 241
LDI r11, 57
LDI r12, 38
LDI r13, 73
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
