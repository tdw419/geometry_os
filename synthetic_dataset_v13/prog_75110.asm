; DESCRIPTION: Composite: Sets a single cyan pixel at (417, 99) then Places a blue line segment connecting (85, 137) to (193, 175) then Places a green 85x66 rectangle at position (202, 161).
; PLAN: r0=417(x), r1=99(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=85(x1), r6=137(y1), r7=193(x2), r8=175(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=202(x), r11=161(y), r12=85(width), r13=66(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 417
LDI r1, 99
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 85
LDI r6, 137
LDI r7, 193
LDI r8, 175
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 202
LDI r11, 161
LDI r12, 85
LDI r13, 66
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
