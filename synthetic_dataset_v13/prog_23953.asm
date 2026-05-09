; DESCRIPTION: Composite: Places a blue dot at position (91, 187) then Places a yellow line segment connecting (503, 229) to (14, 65) then Places a cyan 101x59 rectangle at position (255, 165).
; PLAN: r0=91(x), r1=187(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=503(x1), r6=229(y1), r7=14(x2), r8=65(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=255(x), r11=165(y), r12=101(width), r13=59(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 91
LDI r1, 187
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 503
LDI r6, 229
LDI r7, 14
LDI r8, 65
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 255
LDI r11, 165
LDI r12, 101
LDI r13, 59
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
