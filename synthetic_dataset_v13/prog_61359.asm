; DESCRIPTION: Composite: Draws a cyan line from (61, 190) to (355, 2) then Creates a cyan circular shape at (338, 54) with radius 43 then Places a red 113x69 rectangle at position (212, 21).
; PLAN: r0=61(x1), r1=190(y1), r2=355(x2), r3=2(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=338(x), r6=54(y), r7=43(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=212(x), r11=21(y), r12=113(width), r13=69(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 61
LDI r1, 190
LDI r2, 355
LDI r3, 2
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 338
LDI r6, 54
LDI r7, 43
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 212
LDI r11, 21
LDI r12, 113
LDI r13, 69
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
