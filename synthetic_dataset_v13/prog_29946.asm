; DESCRIPTION: Composite: Creates a white rectangular region at (290, 41) spanning 25 by 102 pixels then Places a red dot at position (104, 93) then Places a cyan line segment connecting (299, 244) to (497, 124).
; PLAN: r0=290(x), r1=41(y), r2=25(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=104(x), r6=93(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=299(x1), r11=244(y1), r12=497(x2), r13=124(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 290
LDI r1, 41
LDI r2, 25
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 104
LDI r6, 93
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 299
LDI r11, 244
LDI r12, 497
LDI r13, 124
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
