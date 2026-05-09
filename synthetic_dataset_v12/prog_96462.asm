; DESCRIPTION: Composite: Draws a red line from (393, 151) to (341, 68) then Places a magenta circle of radius 18 at center (128, 45).
; PLAN: r0=393(x1), r1=151(y1), r2=341(x2), r3=68(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=128(x), r6=45(y), r7=18(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 393
LDI r1, 151
LDI r2, 341
LDI r3, 68
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 128
LDI r6, 45
LDI r7, 18
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
