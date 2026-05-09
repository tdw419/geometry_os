; DESCRIPTION: Composite: Creates a white rectangular region at (298, 118) spanning 107 by 113 pixels then Draws a green line from (1, 47) to (494, 201).
; PLAN: r0=298(x), r1=118(y), r2=107(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=1(x1), r6=47(y1), r7=494(x2), r8=201(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 298
LDI r1, 118
LDI r2, 107
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 1
LDI r6, 47
LDI r7, 494
LDI r8, 201
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
