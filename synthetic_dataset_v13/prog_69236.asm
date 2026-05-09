; DESCRIPTION: Composite: Places a yellow line segment connecting (384, 14) to (213, 202) then Draws a cyan rectangle at (27, 139) with width 17 and height 53.
; PLAN: r0=384(x1), r1=14(y1), r2=213(x2), r3=202(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=27(x), r6=139(y), r7=17(width), r8=53(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 384
LDI r1, 14
LDI r2, 213
LDI r3, 202
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 27
LDI r6, 139
LDI r7, 17
LDI r8, 53
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
