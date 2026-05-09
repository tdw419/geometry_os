; DESCRIPTION: Composite: Places a red circle of radius 76 at center (179, 125) then Places a green dot at position (218, 152).
; PLAN: r0=179(x), r1=125(y), r2=76(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=218(x), r6=152(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 179
LDI r1, 125
LDI r2, 76
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 218
LDI r6, 152
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
