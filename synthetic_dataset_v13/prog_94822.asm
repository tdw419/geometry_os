; DESCRIPTION: Composite: Draws a cyan line from (197, 233) to (489, 172) then Draws a green circle centered at (76, 52) with radius 49 then Renders a cyan box of size 67x97 starting at (213, 58).
; PLAN: r0=197(x1), r1=233(y1), r2=489(x2), r3=172(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=76(x), r6=52(y), r7=49(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=213(x), r11=58(y), r12=67(width), r13=97(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 197
LDI r1, 233
LDI r2, 489
LDI r3, 172
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 76
LDI r6, 52
LDI r7, 49
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 213
LDI r11, 58
LDI r12, 67
LDI r13, 97
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
