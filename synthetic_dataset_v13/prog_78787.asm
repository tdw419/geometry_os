; DESCRIPTION: Composite: Places a white 70x90 rectangle at position (339, 98) then Renders a red disk with center (326, 181) and radius 22 then Places a black line segment connecting (179, 213) to (183, 177).
; PLAN: r0=339(x), r1=98(y), r2=70(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=326(x), r6=181(y), r7=22(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=179(x1), r11=213(y1), r12=183(x2), r13=177(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 339
LDI r1, 98
LDI r2, 70
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 326
LDI r6, 181
LDI r7, 22
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 179
LDI r11, 213
LDI r12, 183
LDI r13, 177
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
