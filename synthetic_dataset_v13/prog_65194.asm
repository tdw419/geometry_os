; DESCRIPTION: Composite: Creates a white rectangular region at (247, 151) spanning 37 by 82 pixels then Renders a cyan line between points (345, 63) and (447, 112) then Sets a single green pixel at (276, 216).
; PLAN: r0=247(x), r1=151(y), r2=37(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=345(x1), r6=63(y1), r7=447(x2), r8=112(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=276(x), r11=216(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 247
LDI r1, 151
LDI r2, 37
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 345
LDI r6, 63
LDI r7, 447
LDI r8, 112
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 276
LDI r11, 216
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
