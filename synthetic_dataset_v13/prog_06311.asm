; DESCRIPTION: Composite: Creates a blue rectangular region at (377, 179) spanning 45 by 32 pixels then Places a magenta line segment connecting (246, 133) to (202, 213) then Sets a single yellow pixel at (435, 192).
; PLAN: r0=377(x), r1=179(y), r2=45(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=246(x1), r6=133(y1), r7=202(x2), r8=213(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=435(x), r11=192(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 377
LDI r1, 179
LDI r2, 45
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 246
LDI r6, 133
LDI r7, 202
LDI r8, 213
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 435
LDI r11, 192
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
