; DESCRIPTION: Composite: Places a blue 25x29 rectangle at position (321, 126) then Places a yellow line segment connecting (209, 132) to (256, 187).
; PLAN: r0=321(x), r1=126(y), r2=25(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=209(x1), r6=132(y1), r7=256(x2), r8=187(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 321
LDI r1, 126
LDI r2, 25
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 209
LDI r6, 132
LDI r7, 256
LDI r8, 187
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
