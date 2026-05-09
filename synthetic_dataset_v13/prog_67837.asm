; DESCRIPTION: Composite: Places a cyan circle of radius 58 at center (88, 147) then Draws a green line from (349, 254) to (73, 59).
; PLAN: r0=88(x), r1=147(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=349(x1), r6=254(y1), r7=73(x2), r8=59(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 88
LDI r1, 147
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 349
LDI r6, 254
LDI r7, 73
LDI r8, 59
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
