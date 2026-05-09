; DESCRIPTION: Composite: Places a cyan dot at position (455, 80) then Renders a red line between points (139, 65) and (243, 129) then Creates a white circular shape at (295, 174) with radius 42.
; PLAN: r0=455(x), r1=80(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=139(x1), r6=65(y1), r7=243(x2), r8=129(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=295(x), r11=174(y), r12=42(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 455
LDI r1, 80
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 139
LDI r6, 65
LDI r7, 243
LDI r8, 129
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 295
LDI r11, 174
LDI r12, 42
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
