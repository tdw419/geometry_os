; DESCRIPTION: Composite: Places a black 33x86 rectangle at position (458, 125) then Places a black line segment connecting (402, 175) to (355, 20) then Places a cyan dot at position (465, 189).
; PLAN: r0=458(x), r1=125(y), r2=33(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=402(x1), r6=175(y1), r7=355(x2), r8=20(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=465(x), r11=189(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 458
LDI r1, 125
LDI r2, 33
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 175
LDI r7, 355
LDI r8, 20
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 465
LDI r11, 189
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
