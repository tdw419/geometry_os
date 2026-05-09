; DESCRIPTION: Composite: Renders a green line between points (371, 187) and (175, 221) then Renders a magenta disk with center (325, 157) and radius 56.
; PLAN: r0=371(x1), r1=187(y1), r2=175(x2), r3=221(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=325(x), r6=157(y), r7=56(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 371
LDI r1, 187
LDI r2, 175
LDI r3, 221
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 325
LDI r6, 157
LDI r7, 56
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
