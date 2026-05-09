; DESCRIPTION: Composite: Places a orange dot at position (117, 46) then Draws a yellow line from (175, 139) to (401, 134) then Renders a cyan disk with center (174, 192) and radius 55.
; PLAN: r0=117(x), r1=46(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=175(x1), r6=139(y1), r7=401(x2), r8=134(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=174(x), r11=192(y), r12=55(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 117
LDI r1, 46
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 175
LDI r6, 139
LDI r7, 401
LDI r8, 134
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 174
LDI r11, 192
LDI r12, 55
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
