; DESCRIPTION: Composite: Places a green circle of radius 24 at center (395, 58) then Draws a magenta line from (416, 83) to (482, 147).
; PLAN: r0=395(x), r1=58(y), r2=24(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=416(x1), r6=83(y1), r7=482(x2), r8=147(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 395
LDI r1, 58
LDI r2, 24
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 416
LDI r6, 83
LDI r7, 482
LDI r8, 147
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
