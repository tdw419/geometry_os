; DESCRIPTION: Composite: Places a magenta circle of radius 12 at center (487, 173) then Places a black line segment connecting (389, 71) to (215, 89).
; PLAN: r0=487(x), r1=173(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=389(x1), r6=71(y1), r7=215(x2), r8=89(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 487
LDI r1, 173
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 389
LDI r6, 71
LDI r7, 215
LDI r8, 89
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
