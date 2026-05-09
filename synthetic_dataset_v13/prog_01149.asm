; DESCRIPTION: Composite: Places a purple circle of radius 68 at center (279, 90) then Renders a cyan box of size 70x34 starting at (265, 200) then Sets a single black pixel at (478, 120).
; PLAN: r0=279(x), r1=90(y), r2=68(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=265(x), r6=200(y), r7=70(width), r8=34(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=478(x), r11=120(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 279
LDI r1, 90
LDI r2, 68
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 265
LDI r6, 200
LDI r7, 70
LDI r8, 34
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 478
LDI r11, 120
LDI r12, 0x000000
PSET r10, r11, r12
HALT
