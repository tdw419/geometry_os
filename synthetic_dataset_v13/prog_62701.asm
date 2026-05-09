; DESCRIPTION: Composite: Creates a yellow circular shape at (220, 148) with radius 18 then Draws a red line from (123, 108) to (284, 58).
; PLAN: r0=220(x), r1=148(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=123(x1), r6=108(y1), r7=284(x2), r8=58(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 220
LDI r1, 148
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 123
LDI r6, 108
LDI r7, 284
LDI r8, 58
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
