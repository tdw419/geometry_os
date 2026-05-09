; DESCRIPTION: Composite: Renders a black line between points (271, 227) and (64, 46) then Places a blue circle of radius 42 at center (51, 173).
; PLAN: r0=271(x1), r1=227(y1), r2=64(x2), r3=46(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=51(x), r6=173(y), r7=42(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 271
LDI r1, 227
LDI r2, 64
LDI r3, 46
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 51
LDI r6, 173
LDI r7, 42
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
