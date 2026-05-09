; DESCRIPTION: Composite: Places a cyan dot at position (248, 238) then Creates a white rectangular region at (348, 67) spanning 29 by 15 pixels then Places a green line segment connecting (422, 125) to (185, 139).
; PLAN: r0=248(x), r1=238(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=348(x), r6=67(y), r7=29(width), r8=15(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=422(x1), r11=125(y1), r12=185(x2), r13=139(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 248
LDI r1, 238
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 348
LDI r6, 67
LDI r7, 29
LDI r8, 15
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 422
LDI r11, 125
LDI r12, 185
LDI r13, 139
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
