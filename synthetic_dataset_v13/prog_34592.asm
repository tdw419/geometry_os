; DESCRIPTION: Composite: Renders a cyan line between points (376, 30) and (298, 32) then Creates a red rectangular region at (431, 126) spanning 29 by 26 pixels then Sets a single white pixel at (355, 146).
; PLAN: r0=376(x1), r1=30(y1), r2=298(x2), r3=32(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=431(x), r6=126(y), r7=29(width), r8=26(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=355(x), r11=146(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 376
LDI r1, 30
LDI r2, 298
LDI r3, 32
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 431
LDI r6, 126
LDI r7, 29
LDI r8, 26
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 355
LDI r11, 146
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
