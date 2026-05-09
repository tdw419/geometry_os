; DESCRIPTION: Composite: Creates a cyan rectangular region at (361, 157) spanning 11 by 76 pixels then Renders a white line between points (143, 104) and (71, 171).
; PLAN: r0=361(x), r1=157(y), r2=11(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=143(x1), r6=104(y1), r7=71(x2), r8=171(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 361
LDI r1, 157
LDI r2, 11
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 143
LDI r6, 104
LDI r7, 71
LDI r8, 171
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
