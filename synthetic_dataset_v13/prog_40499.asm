; DESCRIPTION: Composite: Sets a single green pixel at (344, 194) then Draws a black rectangle at (417, 48) with width 39 and height 86 then Places a yellow line segment connecting (243, 204) to (215, 110).
; PLAN: r0=344(x), r1=194(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=417(x), r6=48(y), r7=39(width), r8=86(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=243(x1), r11=204(y1), r12=215(x2), r13=110(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 344
LDI r1, 194
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 417
LDI r6, 48
LDI r7, 39
LDI r8, 86
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 243
LDI r11, 204
LDI r12, 215
LDI r13, 110
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
