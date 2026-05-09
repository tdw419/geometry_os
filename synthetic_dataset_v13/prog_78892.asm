; DESCRIPTION: Composite: Draws a black circle centered at (123, 152) with radius 44 then Draws a red line from (103, 78) to (80, 243).
; PLAN: r0=123(x), r1=152(y), r2=44(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=103(x1), r6=78(y1), r7=80(x2), r8=243(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 123
LDI r1, 152
LDI r2, 44
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 103
LDI r6, 78
LDI r7, 80
LDI r8, 243
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
