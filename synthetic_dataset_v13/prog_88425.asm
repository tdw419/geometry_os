; DESCRIPTION: Composite: Draws a red rectangle at (337, 86) with width 64 and height 115 then Places a magenta circle of radius 44 at center (186, 202) then Draws a green line from (274, 206) to (334, 192).
; PLAN: r0=337(x), r1=86(y), r2=64(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=186(x), r6=202(y), r7=44(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=274(x1), r11=206(y1), r12=334(x2), r13=192(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 337
LDI r1, 86
LDI r2, 64
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 186
LDI r6, 202
LDI r7, 44
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 274
LDI r11, 206
LDI r12, 334
LDI r13, 192
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
