; DESCRIPTION: Composite: Renders a red disk with center (121, 205) and radius 30 then Places a cyan line segment connecting (281, 138) to (509, 140) then Renders a black box of size 78x50 starting at (296, 57).
; PLAN: r0=121(x), r1=205(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=281(x1), r6=138(y1), r7=509(x2), r8=140(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=296(x), r11=57(y), r12=78(width), r13=50(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 121
LDI r1, 205
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 281
LDI r6, 138
LDI r7, 509
LDI r8, 140
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 296
LDI r11, 57
LDI r12, 78
LDI r13, 50
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
