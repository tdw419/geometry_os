; DESCRIPTION: Composite: Places a purple line segment connecting (250, 167) to (243, 174) then Places a white 65x52 rectangle at position (64, 39) then Places a cyan circle of radius 27 at center (267, 192).
; PLAN: r0=250(x1), r1=167(y1), r2=243(x2), r3=174(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=64(x), r6=39(y), r7=65(width), r8=52(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=267(x), r11=192(y), r12=27(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 250
LDI r1, 167
LDI r2, 243
LDI r3, 174
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 64
LDI r6, 39
LDI r7, 65
LDI r8, 52
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 267
LDI r11, 192
LDI r12, 27
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
