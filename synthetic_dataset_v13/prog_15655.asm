; DESCRIPTION: Composite: Renders a red line between points (300, 95) and (67, 121) then Places a black circle of radius 26 at center (182, 196).
; PLAN: r0=300(x1), r1=95(y1), r2=67(x2), r3=121(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=182(x), r6=196(y), r7=26(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 300
LDI r1, 95
LDI r2, 67
LDI r3, 121
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 182
LDI r6, 196
LDI r7, 26
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
