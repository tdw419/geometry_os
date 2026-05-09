; DESCRIPTION: Composite: Places a blue 50x65 rectangle at position (314, 140) then Sets a single red pixel at (436, 129).
; PLAN: r0=314(x), r1=140(y), r2=50(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=436(x), r6=129(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 314
LDI r1, 140
LDI r2, 50
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 436
LDI r6, 129
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
