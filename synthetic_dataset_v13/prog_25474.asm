; DESCRIPTION: Composite: Places a red circle of radius 45 at center (99, 163) then Places a blue dot at position (265, 61) then Draws a cyan line from (32, 75) to (119, 37).
; PLAN: r0=99(x), r1=163(y), r2=45(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=265(x), r6=61(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=32(x1), r11=75(y1), r12=119(x2), r13=37(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 99
LDI r1, 163
LDI r2, 45
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 265
LDI r6, 61
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 32
LDI r11, 75
LDI r12, 119
LDI r13, 37
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
