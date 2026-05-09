; DESCRIPTION: Composite: Places a cyan 86x94 rectangle at position (346, 160) then Draws a black circle centered at (447, 69) with radius 13 then Renders a cyan line between points (190, 243) and (228, 115).
; PLAN: r0=346(x), r1=160(y), r2=86(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=447(x), r6=69(y), r7=13(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=190(x1), r11=243(y1), r12=228(x2), r13=115(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 346
LDI r1, 160
LDI r2, 86
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 447
LDI r6, 69
LDI r7, 13
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 190
LDI r11, 243
LDI r12, 228
LDI r13, 115
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
