; DESCRIPTION: Composite: Places a black dot at position (449, 1) then Renders a yellow line between points (256, 238) and (77, 215) then Places a yellow circle of radius 56 at center (57, 164).
; PLAN: r0=449(x), r1=1(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=256(x1), r6=238(y1), r7=77(x2), r8=215(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=57(x), r11=164(y), r12=56(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 449
LDI r1, 1
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 256
LDI r6, 238
LDI r7, 77
LDI r8, 215
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 57
LDI r11, 164
LDI r12, 56
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
