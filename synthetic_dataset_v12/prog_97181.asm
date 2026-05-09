; DESCRIPTION: Composite: Creates a yellow rectangular region at (157, 179) spanning 65 by 52 pixels then Draws a yellow line from (439, 202) to (384, 146) then Sets a single purple pixel at (221, 59).
; PLAN: r0=157(x), r1=179(y), r2=65(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=439(x1), r6=202(y1), r7=384(x2), r8=146(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=221(x), r11=59(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 157
LDI r1, 179
LDI r2, 65
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 439
LDI r6, 202
LDI r7, 384
LDI r8, 146
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 221
LDI r11, 59
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
