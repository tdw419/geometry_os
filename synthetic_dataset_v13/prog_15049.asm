; DESCRIPTION: Composite: Places a cyan dot at position (476, 21) then Renders a yellow line between points (30, 81) and (402, 181).
; PLAN: r0=476(x), r1=21(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=30(x1), r6=81(y1), r7=402(x2), r8=181(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 476
LDI r1, 21
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 30
LDI r6, 81
LDI r7, 402
LDI r8, 181
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
