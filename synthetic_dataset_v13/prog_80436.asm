; DESCRIPTION: Composite: Renders a purple box of size 86x116 starting at (263, 36) then Renders a yellow line between points (483, 48) and (441, 60).
; PLAN: r0=263(x), r1=36(y), r2=86(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=483(x1), r6=48(y1), r7=441(x2), r8=60(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 263
LDI r1, 36
LDI r2, 86
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 483
LDI r6, 48
LDI r7, 441
LDI r8, 60
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
