; DESCRIPTION: Composite: Places a red circle of radius 40 at center (234, 206) then Places a white dot at position (207, 196).
; PLAN: r0=234(x), r1=206(y), r2=40(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=207(x), r6=196(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 234
LDI r1, 206
LDI r2, 40
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 207
LDI r6, 196
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
