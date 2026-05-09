; DESCRIPTION: Composite: Places a blue circle of radius 21 at center (321, 38) then Places a blue line segment connecting (267, 215) to (339, 122) then Places a magenta dot at position (405, 152).
; PLAN: r0=321(x), r1=38(y), r2=21(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=267(x1), r6=215(y1), r7=339(x2), r8=122(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=405(x), r11=152(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 321
LDI r1, 38
LDI r2, 21
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 267
LDI r6, 215
LDI r7, 339
LDI r8, 122
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 405
LDI r11, 152
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
