; DESCRIPTION: Composite: Creates a orange circular shape at (277, 145) with radius 60 then Renders a yellow box of size 24x112 starting at (323, 12).
; PLAN: r0=277(x), r1=145(y), r2=60(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=323(x), r6=12(y), r7=24(width), r8=112(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 277
LDI r1, 145
LDI r2, 60
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 323
LDI r6, 12
LDI r7, 24
LDI r8, 112
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
