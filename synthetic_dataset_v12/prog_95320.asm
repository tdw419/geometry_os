; DESCRIPTION: Composite: Draws a cyan line from (451, 197) to (175, 220) then Draws a magenta circle centered at (396, 96) with radius 44 then Places a white 112x57 rectangle at position (345, 18).
; PLAN: r0=451(x1), r1=197(y1), r2=175(x2), r3=220(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=396(x), r6=96(y), r7=44(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=345(x), r11=18(y), r12=112(width), r13=57(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 451
LDI r1, 197
LDI r2, 175
LDI r3, 220
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 396
LDI r6, 96
LDI r7, 44
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 345
LDI r11, 18
LDI r12, 112
LDI r13, 57
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
