; DESCRIPTION: Composite: Places a cyan circle of radius 55 at center (188, 65) then Draws a orange line from (193, 28) to (398, 82) then Places a yellow dot at position (60, 205).
; PLAN: r0=188(x), r1=65(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=193(x1), r6=28(y1), r7=398(x2), r8=82(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=60(x), r11=205(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 188
LDI r1, 65
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 193
LDI r6, 28
LDI r7, 398
LDI r8, 82
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 60
LDI r11, 205
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
