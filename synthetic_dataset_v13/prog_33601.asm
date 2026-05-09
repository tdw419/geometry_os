; DESCRIPTION: Composite: Places a black line segment connecting (233, 251) to (337, 216) then Places a green dot at position (433, 210) then Creates a cyan rectangular region at (211, 38) spanning 18 by 66 pixels.
; PLAN: r0=233(x1), r1=251(y1), r2=337(x2), r3=216(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=433(x), r6=210(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=211(x), r11=38(y), r12=18(width), r13=66(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 233
LDI r1, 251
LDI r2, 337
LDI r3, 216
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 433
LDI r6, 210
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 211
LDI r11, 38
LDI r12, 18
LDI r13, 66
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
