; DESCRIPTION: Composite: Draws a blue line from (16, 27) to (425, 8) then Places a purple circle of radius 80 at center (113, 163).
; PLAN: r0=16(x1), r1=27(y1), r2=425(x2), r3=8(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=113(x), r6=163(y), r7=80(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 16
LDI r1, 27
LDI r2, 425
LDI r3, 8
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 113
LDI r6, 163
LDI r7, 80
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
