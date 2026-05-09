; DESCRIPTION: Composite: Places a black circle of radius 42 at center (367, 198) then Draws a black line from (377, 42) to (342, 148).
; PLAN: r0=367(x), r1=198(y), r2=42(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=377(x1), r6=42(y1), r7=342(x2), r8=148(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 367
LDI r1, 198
LDI r2, 42
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 377
LDI r6, 42
LDI r7, 342
LDI r8, 148
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
