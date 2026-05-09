; DESCRIPTION: Composite: Places a magenta circle of radius 25 at center (179, 213) then Places a orange dot at position (470, 26) then Renders a purple box of size 96x51 starting at (57, 186).
; PLAN: r0=179(x), r1=213(y), r2=25(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=470(x), r6=26(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=57(x), r11=186(y), r12=96(width), r13=51(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 179
LDI r1, 213
LDI r2, 25
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 470
LDI r6, 26
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 57
LDI r11, 186
LDI r12, 96
LDI r13, 51
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
