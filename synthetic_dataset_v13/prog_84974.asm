; DESCRIPTION: Composite: Creates a blue rectangular region at (319, 103) spanning 73 by 58 pixels then Places a cyan circle of radius 25 at center (192, 159) then Renders a black line between points (298, 221) and (187, 182).
; PLAN: r0=319(x), r1=103(y), r2=73(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=192(x), r6=159(y), r7=25(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=298(x1), r11=221(y1), r12=187(x2), r13=182(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 319
LDI r1, 103
LDI r2, 73
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 192
LDI r6, 159
LDI r7, 25
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 298
LDI r11, 221
LDI r12, 187
LDI r13, 182
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
