; DESCRIPTION: Composite: Renders a white box of size 108x66 starting at (305, 107) then Draws a green circle centered at (339, 120) with radius 53 then Renders a cyan line between points (176, 24) and (43, 177).
; PLAN: r0=305(x), r1=107(y), r2=108(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=339(x), r6=120(y), r7=53(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=176(x1), r11=24(y1), r12=43(x2), r13=177(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 305
LDI r1, 107
LDI r2, 108
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 339
LDI r6, 120
LDI r7, 53
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 176
LDI r11, 24
LDI r12, 43
LDI r13, 177
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
