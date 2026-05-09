; DESCRIPTION: Composite: Draws a cyan line from (454, 58) to (279, 230) then Places a white circle of radius 56 at center (166, 151) then Places a red 38x94 rectangle at position (293, 109).
; PLAN: r0=454(x1), r1=58(y1), r2=279(x2), r3=230(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=166(x), r6=151(y), r7=56(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=293(x), r11=109(y), r12=38(width), r13=94(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 454
LDI r1, 58
LDI r2, 279
LDI r3, 230
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 166
LDI r6, 151
LDI r7, 56
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 293
LDI r11, 109
LDI r12, 38
LDI r13, 94
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
