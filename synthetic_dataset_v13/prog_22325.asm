; DESCRIPTION: Composite: Places a cyan dot at position (429, 93) then Draws a yellow line from (240, 218) to (326, 53) then Creates a red circular shape at (438, 127) with radius 12.
; PLAN: r0=429(x), r1=93(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=240(x1), r6=218(y1), r7=326(x2), r8=53(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=438(x), r11=127(y), r12=12(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 429
LDI r1, 93
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 240
LDI r6, 218
LDI r7, 326
LDI r8, 53
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 438
LDI r11, 127
LDI r12, 12
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
