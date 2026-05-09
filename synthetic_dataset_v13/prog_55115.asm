; DESCRIPTION: Composite: Places a orange 27x115 rectangle at position (483, 57) then Sets a single purple pixel at (190, 111) then Renders a cyan line between points (190, 182) and (204, 119).
; PLAN: r0=483(x), r1=57(y), r2=27(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=190(x), r6=111(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=190(x1), r11=182(y1), r12=204(x2), r13=119(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 483
LDI r1, 57
LDI r2, 27
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 190
LDI r6, 111
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 190
LDI r11, 182
LDI r12, 204
LDI r13, 119
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
