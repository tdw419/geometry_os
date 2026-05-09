; DESCRIPTION: Composite: Creates a orange circular shape at (188, 166) with radius 56 then Draws a white line from (372, 209) to (92, 238).
; PLAN: r0=188(x), r1=166(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=372(x1), r6=209(y1), r7=92(x2), r8=238(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 188
LDI r1, 166
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 372
LDI r6, 209
LDI r7, 92
LDI r8, 238
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
