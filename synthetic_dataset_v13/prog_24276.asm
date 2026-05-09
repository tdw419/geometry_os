; DESCRIPTION: Composite: Draws a green rectangle at (286, 10) with width 49 and height 60 then Places a white line segment connecting (103, 237) to (176, 132) then Places a black dot at position (509, 244).
; PLAN: r0=286(x), r1=10(y), r2=49(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=103(x1), r6=237(y1), r7=176(x2), r8=132(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=509(x), r11=244(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 286
LDI r1, 10
LDI r2, 49
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 237
LDI r7, 176
LDI r8, 132
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 509
LDI r11, 244
LDI r12, 0x000000
PSET r10, r11, r12
HALT
