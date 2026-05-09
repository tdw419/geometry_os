; DESCRIPTION: Composite: Sets a single cyan pixel at (159, 179) then Places a yellow line segment connecting (54, 172) to (95, 90) then Places a blue 67x32 rectangle at position (435, 161).
; PLAN: r0=159(x), r1=179(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=54(x1), r6=172(y1), r7=95(x2), r8=90(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=435(x), r11=161(y), r12=67(width), r13=32(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 159
LDI r1, 179
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 54
LDI r6, 172
LDI r7, 95
LDI r8, 90
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 435
LDI r11, 161
LDI r12, 67
LDI r13, 32
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
