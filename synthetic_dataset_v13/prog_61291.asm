; DESCRIPTION: Composite: Renders a magenta box of size 97x61 starting at (124, 50) then Renders a magenta line between points (65, 197) and (334, 223) then Sets a single yellow pixel at (445, 160).
; PLAN: r0=124(x), r1=50(y), r2=97(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=65(x1), r6=197(y1), r7=334(x2), r8=223(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=445(x), r11=160(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 124
LDI r1, 50
LDI r2, 97
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 197
LDI r7, 334
LDI r8, 223
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 445
LDI r11, 160
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
