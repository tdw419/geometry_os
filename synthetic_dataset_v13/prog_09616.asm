; DESCRIPTION: Composite: Draws a cyan line from (236, 37) to (252, 175) then Creates a green circular shape at (253, 120) with radius 16.
; PLAN: r0=236(x1), r1=37(y1), r2=252(x2), r3=175(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=253(x), r6=120(y), r7=16(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 236
LDI r1, 37
LDI r2, 252
LDI r3, 175
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 120
LDI r7, 16
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
