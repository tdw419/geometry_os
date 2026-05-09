; DESCRIPTION: Composite: Places a orange 60x94 rectangle at position (302, 19) then Renders a white line between points (264, 194) and (307, 249) then Places a black circle of radius 14 at center (410, 193).
; PLAN: r0=302(x), r1=19(y), r2=60(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=264(x1), r6=194(y1), r7=307(x2), r8=249(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=410(x), r11=193(y), r12=14(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 302
LDI r1, 19
LDI r2, 60
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 264
LDI r6, 194
LDI r7, 307
LDI r8, 249
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 410
LDI r11, 193
LDI r12, 14
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
