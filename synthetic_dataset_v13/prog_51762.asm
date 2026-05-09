; DESCRIPTION: Composite: Renders a purple line between points (368, 160) and (421, 67) then Places a magenta circle of radius 14 at center (90, 193).
; PLAN: r0=368(x1), r1=160(y1), r2=421(x2), r3=67(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=90(x), r6=193(y), r7=14(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 368
LDI r1, 160
LDI r2, 421
LDI r3, 67
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 90
LDI r6, 193
LDI r7, 14
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
