; DESCRIPTION: Composite: Renders a green disk with center (222, 68) and radius 43 then Draws a yellow line from (308, 51) to (228, 38).
; PLAN: r0=222(x), r1=68(y), r2=43(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=308(x1), r6=51(y1), r7=228(x2), r8=38(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 222
LDI r1, 68
LDI r2, 43
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 308
LDI r6, 51
LDI r7, 228
LDI r8, 38
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
