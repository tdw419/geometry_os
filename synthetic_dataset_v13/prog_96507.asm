; DESCRIPTION: Composite: Draws a red line from (59, 180) to (425, 67) then Places a blue dot at position (228, 24) then Creates a magenta circular shape at (103, 103) with radius 64.
; PLAN: r0=59(x1), r1=180(y1), r2=425(x2), r3=67(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=228(x), r6=24(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=103(x), r11=103(y), r12=64(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 59
LDI r1, 180
LDI r2, 425
LDI r3, 67
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 228
LDI r6, 24
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 103
LDI r11, 103
LDI r12, 64
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
