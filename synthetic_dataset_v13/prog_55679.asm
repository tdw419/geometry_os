; DESCRIPTION: Composite: Places a white 54x25 rectangle at position (350, 142) then Sets a single purple pixel at (377, 244).
; PLAN: r0=350(x), r1=142(y), r2=54(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=377(x), r6=244(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 350
LDI r1, 142
LDI r2, 54
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 377
LDI r6, 244
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
