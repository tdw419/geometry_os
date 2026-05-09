; DESCRIPTION: Composite: Draws a yellow circle centered at (218, 68) with radius 28 then Draws a green line from (301, 14) to (369, 241).
; PLAN: r0=218(x), r1=68(y), r2=28(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=301(x1), r6=14(y1), r7=369(x2), r8=241(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 218
LDI r1, 68
LDI r2, 28
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 301
LDI r6, 14
LDI r7, 369
LDI r8, 241
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
