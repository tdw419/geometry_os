; DESCRIPTION: Composite: Places a black circle of radius 37 at center (308, 82) then Renders a yellow box of size 71x59 starting at (147, 77).
; PLAN: r0=308(x), r1=82(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=147(x), r6=77(y), r7=71(width), r8=59(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 308
LDI r1, 82
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 147
LDI r6, 77
LDI r7, 71
LDI r8, 59
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
