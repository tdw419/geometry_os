; DESCRIPTION: Composite: Places a white circle of radius 50 at center (131, 111) then Renders a green line between points (493, 189) and (104, 24).
; PLAN: r0=131(x), r1=111(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=493(x1), r6=189(y1), r7=104(x2), r8=24(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 131
LDI r1, 111
LDI r2, 50
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 493
LDI r6, 189
LDI r7, 104
LDI r8, 24
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
