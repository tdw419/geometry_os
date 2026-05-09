; DESCRIPTION: Composite: Renders a red disk with center (359, 100) and radius 80 then Draws a magenta line from (128, 42) to (286, 200) then Places a black dot at position (307, 2).
; PLAN: r0=359(x), r1=100(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=128(x1), r6=42(y1), r7=286(x2), r8=200(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=307(x), r11=2(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 359
LDI r1, 100
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 128
LDI r6, 42
LDI r7, 286
LDI r8, 200
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 307
LDI r11, 2
LDI r12, 0x000000
PSET r10, r11, r12
HALT
