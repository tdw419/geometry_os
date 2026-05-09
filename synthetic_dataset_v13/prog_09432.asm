; DESCRIPTION: Composite: Sets a single yellow pixel at (47, 126) then Draws a yellow line from (435, 73) to (243, 51) then Creates a cyan circular shape at (181, 35) with radius 27.
; PLAN: r0=47(x), r1=126(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=435(x1), r6=73(y1), r7=243(x2), r8=51(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=181(x), r11=35(y), r12=27(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 47
LDI r1, 126
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 435
LDI r6, 73
LDI r7, 243
LDI r8, 51
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 181
LDI r11, 35
LDI r12, 27
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
