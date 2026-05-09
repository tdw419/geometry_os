; DESCRIPTION: Composite: Places a green circle of radius 59 at center (339, 62) then Draws a black line from (61, 228) to (252, 221).
; PLAN: r0=339(x), r1=62(y), r2=59(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=61(x1), r6=228(y1), r7=252(x2), r8=221(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 339
LDI r1, 62
LDI r2, 59
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 61
LDI r6, 228
LDI r7, 252
LDI r8, 221
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
