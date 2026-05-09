; DESCRIPTION: Composite: Sets a single red pixel at (307, 120) then Draws a black line from (375, 220) to (124, 25) then Draws a magenta circle centered at (42, 116) with radius 39.
; PLAN: r0=307(x), r1=120(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=375(x1), r6=220(y1), r7=124(x2), r8=25(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=42(x), r11=116(y), r12=39(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 307
LDI r1, 120
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 375
LDI r6, 220
LDI r7, 124
LDI r8, 25
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 42
LDI r11, 116
LDI r12, 39
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
