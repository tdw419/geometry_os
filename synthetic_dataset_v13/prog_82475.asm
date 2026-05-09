; DESCRIPTION: Composite: Creates a magenta circular shape at (276, 212) with radius 12 then Places a green dot at position (206, 233) then Renders a black line between points (431, 146) and (113, 72).
; PLAN: r0=276(x), r1=212(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=206(x), r6=233(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=431(x1), r11=146(y1), r12=113(x2), r13=72(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 276
LDI r1, 212
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 206
LDI r6, 233
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 431
LDI r11, 146
LDI r12, 113
LDI r13, 72
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
