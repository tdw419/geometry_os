; DESCRIPTION: Composite: Places a red line segment connecting (296, 243) to (394, 193) then Places a black 73x25 rectangle at position (268, 135) then Places a black circle of radius 47 at center (238, 51).
; PLAN: r0=296(x1), r1=243(y1), r2=394(x2), r3=193(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=268(x), r6=135(y), r7=73(width), r8=25(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=238(x), r11=51(y), r12=47(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 296
LDI r1, 243
LDI r2, 394
LDI r3, 193
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 268
LDI r6, 135
LDI r7, 73
LDI r8, 25
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 238
LDI r11, 51
LDI r12, 47
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
