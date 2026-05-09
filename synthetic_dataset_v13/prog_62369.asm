; DESCRIPTION: Composite: Places a cyan 15x70 rectangle at position (433, 97) then Creates a red circular shape at (332, 200) with radius 54 then Draws a cyan line from (407, 197) to (210, 31).
; PLAN: r0=433(x), r1=97(y), r2=15(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=332(x), r6=200(y), r7=54(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=407(x1), r11=197(y1), r12=210(x2), r13=31(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 433
LDI r1, 97
LDI r2, 15
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 332
LDI r6, 200
LDI r7, 54
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 407
LDI r11, 197
LDI r12, 210
LDI r13, 31
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
