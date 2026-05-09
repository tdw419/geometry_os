; DESCRIPTION: Composite: Places a magenta dot at position (352, 35) then Draws a green line from (202, 74) to (205, 213) then Places a black circle of radius 22 at center (232, 86).
; PLAN: r0=352(x), r1=35(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=202(x1), r6=74(y1), r7=205(x2), r8=213(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=232(x), r11=86(y), r12=22(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 352
LDI r1, 35
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 202
LDI r6, 74
LDI r7, 205
LDI r8, 213
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 232
LDI r11, 86
LDI r12, 22
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
