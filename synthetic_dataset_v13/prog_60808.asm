; DESCRIPTION: Composite: Creates a cyan circular shape at (303, 141) with radius 45 then Draws a black line from (33, 173) to (134, 24) then Places a purple dot at position (150, 77).
; PLAN: r0=303(x), r1=141(y), r2=45(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=33(x1), r6=173(y1), r7=134(x2), r8=24(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=150(x), r11=77(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 303
LDI r1, 141
LDI r2, 45
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 33
LDI r6, 173
LDI r7, 134
LDI r8, 24
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 150
LDI r11, 77
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
