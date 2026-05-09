; DESCRIPTION: Composite: Renders a white disk with center (390, 157) and radius 64 then Draws a magenta line from (242, 61) to (288, 25).
; PLAN: r0=390(x), r1=157(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=242(x1), r6=61(y1), r7=288(x2), r8=25(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 390
LDI r1, 157
LDI r2, 64
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 242
LDI r6, 61
LDI r7, 288
LDI r8, 25
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
