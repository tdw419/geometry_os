; DESCRIPTION: Composite: Sets a single white pixel at (448, 46) then Renders a red disk with center (445, 104) and radius 57 then Places a red 79x73 rectangle at position (75, 31).
; PLAN: r0=448(x), r1=46(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=445(x), r6=104(y), r7=57(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=75(x), r11=31(y), r12=79(width), r13=73(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 448
LDI r1, 46
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 445
LDI r6, 104
LDI r7, 57
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 75
LDI r11, 31
LDI r12, 79
LDI r13, 73
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
