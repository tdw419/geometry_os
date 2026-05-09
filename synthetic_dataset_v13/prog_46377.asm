; DESCRIPTION: Composite: Places a red circle of radius 72 at center (291, 127) then Renders a cyan line between points (21, 77) and (28, 18) then Places a orange dot at position (272, 188).
; PLAN: r0=291(x), r1=127(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=21(x1), r6=77(y1), r7=28(x2), r8=18(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=272(x), r11=188(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 291
LDI r1, 127
LDI r2, 72
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 21
LDI r6, 77
LDI r7, 28
LDI r8, 18
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 272
LDI r11, 188
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
