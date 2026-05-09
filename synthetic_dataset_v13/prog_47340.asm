; DESCRIPTION: Composite: Draws a black rectangle at (298, 59) with width 36 and height 62 then Places a yellow line segment connecting (117, 130) to (498, 47) then Places a purple dot at position (326, 177).
; PLAN: r0=298(x), r1=59(y), r2=36(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=117(x1), r6=130(y1), r7=498(x2), r8=47(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=326(x), r11=177(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 298
LDI r1, 59
LDI r2, 36
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 117
LDI r6, 130
LDI r7, 498
LDI r8, 47
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 326
LDI r11, 177
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
