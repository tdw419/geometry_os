; DESCRIPTION: Composite: Creates a yellow circular shape at (167, 177) with radius 64 then Draws a green rectangle at (317, 128) with width 102 and height 71 then Draws a blue line from (439, 204) to (3, 126).
; PLAN: r0=167(x), r1=177(y), r2=64(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=317(x), r6=128(y), r7=102(width), r8=71(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=439(x1), r11=204(y1), r12=3(x2), r13=126(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 167
LDI r1, 177
LDI r2, 64
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 317
LDI r6, 128
LDI r7, 102
LDI r8, 71
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 439
LDI r11, 204
LDI r12, 3
LDI r13, 126
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
