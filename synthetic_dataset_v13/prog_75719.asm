; DESCRIPTION: Composite: Places a blue 26x90 rectangle at position (148, 124) then Places a yellow line segment connecting (117, 10) to (269, 254) then Places a blue dot at position (379, 240).
; PLAN: r0=148(x), r1=124(y), r2=26(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=117(x1), r6=10(y1), r7=269(x2), r8=254(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=379(x), r11=240(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 148
LDI r1, 124
LDI r2, 26
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 117
LDI r6, 10
LDI r7, 269
LDI r8, 254
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 379
LDI r11, 240
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
