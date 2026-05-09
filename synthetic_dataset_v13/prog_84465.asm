; DESCRIPTION: Composite: Creates a black rectangular region at (307, 139) spanning 115 by 12 pixels then Draws a white line from (383, 223) to (487, 189) then Sets a single red pixel at (295, 216).
; PLAN: r0=307(x), r1=139(y), r2=115(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=383(x1), r6=223(y1), r7=487(x2), r8=189(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=295(x), r11=216(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 307
LDI r1, 139
LDI r2, 115
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 383
LDI r6, 223
LDI r7, 487
LDI r8, 189
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 295
LDI r11, 216
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
