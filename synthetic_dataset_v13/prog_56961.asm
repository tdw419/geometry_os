; DESCRIPTION: Composite: Draws a cyan rectangle at (78, 95) with width 81 and height 82 then Renders a magenta disk with center (53, 73) and radius 32 then Renders a green line between points (473, 142) and (329, 215).
; PLAN: r0=78(x), r1=95(y), r2=81(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=53(x), r6=73(y), r7=32(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=473(x1), r11=142(y1), r12=329(x2), r13=215(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 78
LDI r1, 95
LDI r2, 81
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 53
LDI r6, 73
LDI r7, 32
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 473
LDI r11, 142
LDI r12, 329
LDI r13, 215
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
