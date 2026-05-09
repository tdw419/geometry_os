; DESCRIPTION: Composite: Places a magenta circle of radius 10 at center (125, 45) then Renders a yellow line between points (38, 143) and (397, 233).
; PLAN: r0=125(x), r1=45(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=38(x1), r6=143(y1), r7=397(x2), r8=233(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 125
LDI r1, 45
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 38
LDI r6, 143
LDI r7, 397
LDI r8, 233
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
