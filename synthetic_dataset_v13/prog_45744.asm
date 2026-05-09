; DESCRIPTION: Composite: Places a purple 98x74 rectangle at position (134, 22) then Places a red dot at position (329, 97) then Places a green circle of radius 24 at center (60, 152).
; PLAN: r0=134(x), r1=22(y), r2=98(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=329(x), r6=97(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=60(x), r11=152(y), r12=24(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 134
LDI r1, 22
LDI r2, 98
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 329
LDI r6, 97
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 60
LDI r11, 152
LDI r12, 24
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
