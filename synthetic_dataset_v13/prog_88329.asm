; DESCRIPTION: Composite: Sets a single magenta pixel at (335, 86) then Draws a purple rectangle at (182, 163) with width 16 and height 60 then Renders a red line between points (98, 175) and (27, 186).
; PLAN: r0=335(x), r1=86(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=182(x), r6=163(y), r7=16(width), r8=60(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=98(x1), r11=175(y1), r12=27(x2), r13=186(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 335
LDI r1, 86
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 182
LDI r6, 163
LDI r7, 16
LDI r8, 60
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 98
LDI r11, 175
LDI r12, 27
LDI r13, 186
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
