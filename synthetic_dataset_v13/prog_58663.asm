; DESCRIPTION: Composite: Places a magenta dot at position (365, 61) then Places a black circle of radius 45 at center (185, 139) then Draws a yellow line from (39, 9) to (21, 67).
; PLAN: r0=365(x), r1=61(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=185(x), r6=139(y), r7=45(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=39(x1), r11=9(y1), r12=21(x2), r13=67(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 365
LDI r1, 61
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 185
LDI r6, 139
LDI r7, 45
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 39
LDI r11, 9
LDI r12, 21
LDI r13, 67
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
