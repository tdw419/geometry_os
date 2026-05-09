; DESCRIPTION: Composite: Renders a red line between points (236, 47) and (64, 207) then Places a magenta circle of radius 12 at center (39, 144).
; PLAN: r0=236(x1), r1=47(y1), r2=64(x2), r3=207(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=39(x), r6=144(y), r7=12(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 236
LDI r1, 47
LDI r2, 64
LDI r3, 207
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 39
LDI r6, 144
LDI r7, 12
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
