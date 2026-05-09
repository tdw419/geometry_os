; DESCRIPTION: Composite: Renders a green disk with center (68, 64) and radius 16 then Draws a purple line from (230, 192) to (42, 93).
; PLAN: r0=68(x), r1=64(y), r2=16(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=230(x1), r6=192(y1), r7=42(x2), r8=93(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 68
LDI r1, 64
LDI r2, 16
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 230
LDI r6, 192
LDI r7, 42
LDI r8, 93
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
