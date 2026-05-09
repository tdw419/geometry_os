; DESCRIPTION: Composite: Places a magenta dot at position (265, 39) then Places a white circle of radius 30 at center (342, 223) then Renders a black line between points (59, 207) and (337, 90).
; PLAN: r0=265(x), r1=39(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=342(x), r6=223(y), r7=30(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=59(x1), r11=207(y1), r12=337(x2), r13=90(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 265
LDI r1, 39
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 342
LDI r6, 223
LDI r7, 30
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 59
LDI r11, 207
LDI r12, 337
LDI r13, 90
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
