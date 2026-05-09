; DESCRIPTION: Composite: Sets a single purple pixel at (416, 214) then Draws a black line from (279, 29) to (28, 213) then Places a magenta circle of radius 36 at center (100, 82).
; PLAN: r0=416(x), r1=214(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=279(x1), r6=29(y1), r7=28(x2), r8=213(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=100(x), r11=82(y), r12=36(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 416
LDI r1, 214
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 279
LDI r6, 29
LDI r7, 28
LDI r8, 213
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 100
LDI r11, 82
LDI r12, 36
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
