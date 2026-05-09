; DESCRIPTION: Composite: Places a green dot at position (433, 100) then Draws a magenta circle centered at (25, 228) with radius 10 then Draws a red line from (96, 0) to (351, 141).
; PLAN: r0=433(x), r1=100(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=25(x), r6=228(y), r7=10(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=96(x1), r11=0(y1), r12=351(x2), r13=141(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 433
LDI r1, 100
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 25
LDI r6, 228
LDI r7, 10
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 96
LDI r11, 0
LDI r12, 351
LDI r13, 141
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
