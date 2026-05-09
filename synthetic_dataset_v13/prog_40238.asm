; DESCRIPTION: Composite: Renders a white box of size 48x87 starting at (275, 104) then Places a green line segment connecting (175, 201) to (92, 3) then Sets a single magenta pixel at (405, 19).
; PLAN: r0=275(x), r1=104(y), r2=48(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=175(x1), r6=201(y1), r7=92(x2), r8=3(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=405(x), r11=19(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 275
LDI r1, 104
LDI r2, 48
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 175
LDI r6, 201
LDI r7, 92
LDI r8, 3
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 405
LDI r11, 19
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
