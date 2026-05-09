; DESCRIPTION: Composite: Draws a yellow circle centered at (334, 129) with radius 33 then Draws a magenta line from (154, 96) to (367, 101).
; PLAN: r0=334(x), r1=129(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=154(x1), r6=96(y1), r7=367(x2), r8=101(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 334
LDI r1, 129
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 154
LDI r6, 96
LDI r7, 367
LDI r8, 101
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
