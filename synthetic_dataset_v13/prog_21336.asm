; DESCRIPTION: Composite: Places a blue 51x19 rectangle at position (412, 230) then Creates a cyan circular shape at (138, 126) with radius 71 then Renders a white line between points (84, 57) and (220, 217).
; PLAN: r0=412(x), r1=230(y), r2=51(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=138(x), r6=126(y), r7=71(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=84(x1), r11=57(y1), r12=220(x2), r13=217(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 412
LDI r1, 230
LDI r2, 51
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 138
LDI r6, 126
LDI r7, 71
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 84
LDI r11, 57
LDI r12, 220
LDI r13, 217
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
