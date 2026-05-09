; DESCRIPTION: Composite: Places a blue line segment connecting (385, 188) to (417, 188) then Places a blue 115x93 rectangle at position (205, 70).
; PLAN: r0=385(x1), r1=188(y1), r2=417(x2), r3=188(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=205(x), r6=70(y), r7=115(width), r8=93(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 385
LDI r1, 188
LDI r2, 417
LDI r3, 188
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 205
LDI r6, 70
LDI r7, 115
LDI r8, 93
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
