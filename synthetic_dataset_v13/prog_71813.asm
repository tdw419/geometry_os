; DESCRIPTION: Composite: Places a black circle of radius 27 at center (84, 105) then Draws a red line from (230, 32) to (487, 27).
; PLAN: r0=84(x), r1=105(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=230(x1), r6=32(y1), r7=487(x2), r8=27(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 84
LDI r1, 105
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 230
LDI r6, 32
LDI r7, 487
LDI r8, 27
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
