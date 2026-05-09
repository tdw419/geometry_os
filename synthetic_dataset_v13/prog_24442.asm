; DESCRIPTION: Composite: Draws a green line from (479, 141) to (305, 78) then Places a orange dot at position (188, 120) then Places a cyan circle of radius 37 at center (231, 206).
; PLAN: r0=479(x1), r1=141(y1), r2=305(x2), r3=78(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=188(x), r6=120(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=231(x), r11=206(y), r12=37(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 479
LDI r1, 141
LDI r2, 305
LDI r3, 78
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 188
LDI r6, 120
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 231
LDI r11, 206
LDI r12, 37
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
