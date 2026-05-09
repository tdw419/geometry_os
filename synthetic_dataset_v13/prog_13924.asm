; DESCRIPTION: Composite: Draws a magenta line from (80, 115) to (411, 255) then Places a yellow circle of radius 29 at center (75, 117).
; PLAN: r0=80(x1), r1=115(y1), r2=411(x2), r3=255(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=75(x), r6=117(y), r7=29(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 80
LDI r1, 115
LDI r2, 411
LDI r3, 255
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 75
LDI r6, 117
LDI r7, 29
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
