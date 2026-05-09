; DESCRIPTION: Composite: Creates a white circular shape at (344, 131) with radius 62 then Places a black dot at position (327, 84) then Draws a green line from (391, 204) to (456, 16).
; PLAN: r0=344(x), r1=131(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=327(x), r6=84(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=391(x1), r11=204(y1), r12=456(x2), r13=16(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 344
LDI r1, 131
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 327
LDI r6, 84
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 391
LDI r11, 204
LDI r12, 456
LDI r13, 16
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
