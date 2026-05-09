; DESCRIPTION: Composite: Renders a red disk with center (196, 139) and radius 26 then Draws a magenta line from (42, 184) to (19, 228) then Sets a single cyan pixel at (438, 227).
; PLAN: r0=196(x), r1=139(y), r2=26(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=42(x1), r6=184(y1), r7=19(x2), r8=228(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=438(x), r11=227(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 196
LDI r1, 139
LDI r2, 26
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 42
LDI r6, 184
LDI r7, 19
LDI r8, 228
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 438
LDI r11, 227
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
