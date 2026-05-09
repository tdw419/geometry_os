; DESCRIPTION: Composite: Draws a green line from (45, 86) to (105, 86) then Places a red circle of radius 44 at center (174, 186).
; PLAN: r0=45(x1), r1=86(y1), r2=105(x2), r3=86(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=174(x), r6=186(y), r7=44(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 45
LDI r1, 86
LDI r2, 105
LDI r3, 86
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 174
LDI r6, 186
LDI r7, 44
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
