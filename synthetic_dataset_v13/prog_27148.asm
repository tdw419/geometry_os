; DESCRIPTION: Composite: Renders a purple line between points (386, 115) and (103, 243) then Creates a cyan circular shape at (255, 190) with radius 50 then Sets a single cyan pixel at (269, 208).
; PLAN: r0=386(x1), r1=115(y1), r2=103(x2), r3=243(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=255(x), r6=190(y), r7=50(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=269(x), r11=208(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 386
LDI r1, 115
LDI r2, 103
LDI r3, 243
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 255
LDI r6, 190
LDI r7, 50
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 269
LDI r11, 208
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
