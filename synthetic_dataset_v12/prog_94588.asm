; DESCRIPTION: Composite: Places a magenta dot at position (105, 221) then Draws a purple line from (397, 59) to (87, 210) then Places a green circle of radius 79 at center (184, 139).
; PLAN: r0=105(x), r1=221(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=397(x1), r6=59(y1), r7=87(x2), r8=210(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=184(x), r11=139(y), r12=79(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 105
LDI r1, 221
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 397
LDI r6, 59
LDI r7, 87
LDI r8, 210
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 184
LDI r11, 139
LDI r12, 79
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
