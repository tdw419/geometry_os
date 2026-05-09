; DESCRIPTION: Composite: Creates a white circular shape at (208, 204) with radius 45 then Draws a yellow line from (373, 144) to (242, 59).
; PLAN: r0=208(x), r1=204(y), r2=45(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=373(x1), r6=144(y1), r7=242(x2), r8=59(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 208
LDI r1, 204
LDI r2, 45
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 373
LDI r6, 144
LDI r7, 242
LDI r8, 59
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
