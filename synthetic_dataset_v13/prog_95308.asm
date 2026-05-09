; DESCRIPTION: Composite: Renders a magenta disk with center (216, 103) and radius 79 then Renders a white line between points (10, 164) and (383, 197).
; PLAN: r0=216(x), r1=103(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=10(x1), r6=164(y1), r7=383(x2), r8=197(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 216
LDI r1, 103
LDI r2, 79
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 10
LDI r6, 164
LDI r7, 383
LDI r8, 197
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
