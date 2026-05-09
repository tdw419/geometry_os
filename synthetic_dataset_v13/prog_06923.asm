; DESCRIPTION: Composite: Draws a orange circle centered at (247, 160) with radius 58 then Draws a white line from (146, 213) to (92, 78).
; PLAN: r0=247(x), r1=160(y), r2=58(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=146(x1), r6=213(y1), r7=92(x2), r8=78(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 247
LDI r1, 160
LDI r2, 58
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 146
LDI r6, 213
LDI r7, 92
LDI r8, 78
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
