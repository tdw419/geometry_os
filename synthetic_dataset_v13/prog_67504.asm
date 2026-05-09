; DESCRIPTION: Composite: Creates a cyan circular shape at (27, 150) with radius 25 then Draws a purple line from (176, 246) to (62, 242).
; PLAN: r0=27(x), r1=150(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=176(x1), r6=246(y1), r7=62(x2), r8=242(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 27
LDI r1, 150
LDI r2, 25
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 176
LDI r6, 246
LDI r7, 62
LDI r8, 242
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
