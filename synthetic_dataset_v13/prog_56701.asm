; DESCRIPTION: Composite: Creates a blue circular shape at (197, 131) with radius 62 then Places a purple line segment connecting (329, 47) to (19, 221) then Places a white 28x15 rectangle at position (323, 154).
; PLAN: r0=197(x), r1=131(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=329(x1), r6=47(y1), r7=19(x2), r8=221(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=323(x), r11=154(y), r12=28(width), r13=15(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 197
LDI r1, 131
LDI r2, 62
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 329
LDI r6, 47
LDI r7, 19
LDI r8, 221
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 323
LDI r11, 154
LDI r12, 28
LDI r13, 15
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
