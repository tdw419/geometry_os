; DESCRIPTION: Composite: Creates a cyan circular shape at (362, 188) with radius 67 then Renders a yellow line between points (281, 90) and (248, 56).
; PLAN: r0=362(x), r1=188(y), r2=67(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=281(x1), r6=90(y1), r7=248(x2), r8=56(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 362
LDI r1, 188
LDI r2, 67
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 281
LDI r6, 90
LDI r7, 248
LDI r8, 56
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
