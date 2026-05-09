; DESCRIPTION: Composite: Places a purple 60x110 rectangle at position (269, 58) then Renders a cyan line between points (23, 169) and (163, 26).
; PLAN: r0=269(x), r1=58(y), r2=60(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=23(x1), r6=169(y1), r7=163(x2), r8=26(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 269
LDI r1, 58
LDI r2, 60
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 23
LDI r6, 169
LDI r7, 163
LDI r8, 26
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
