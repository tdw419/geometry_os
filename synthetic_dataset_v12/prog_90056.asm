; DESCRIPTION: Composite: Creates a yellow rectangular region at (216, 41) spanning 80 by 96 pixels then Places a black line segment connecting (271, 213) to (264, 115) then Places a cyan dot at position (370, 65).
; PLAN: r0=216(x), r1=41(y), r2=80(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=271(x1), r6=213(y1), r7=264(x2), r8=115(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=370(x), r11=65(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 216
LDI r1, 41
LDI r2, 80
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 213
LDI r7, 264
LDI r8, 115
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 370
LDI r11, 65
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
