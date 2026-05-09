; DESCRIPTION: Composite: Places a yellow 24x72 rectangle at position (302, 106) then Renders a purple line between points (53, 210) and (200, 111).
; PLAN: r0=302(x), r1=106(y), r2=24(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=53(x1), r6=210(y1), r7=200(x2), r8=111(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 302
LDI r1, 106
LDI r2, 24
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 53
LDI r6, 210
LDI r7, 200
LDI r8, 111
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
