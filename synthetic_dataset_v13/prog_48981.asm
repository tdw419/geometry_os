; DESCRIPTION: Composite: Renders a blue disk with center (192, 190) and radius 65 then Sets a single cyan pixel at (263, 114) then Draws a yellow line from (468, 168) to (393, 98).
; PLAN: r0=192(x), r1=190(y), r2=65(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=263(x), r6=114(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=468(x1), r11=168(y1), r12=393(x2), r13=98(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 192
LDI r1, 190
LDI r2, 65
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 263
LDI r6, 114
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 468
LDI r11, 168
LDI r12, 393
LDI r13, 98
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
