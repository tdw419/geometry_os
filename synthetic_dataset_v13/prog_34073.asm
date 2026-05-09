; DESCRIPTION: Composite: Places a magenta dot at position (262, 202) then Places a magenta line segment connecting (7, 103) to (360, 253) then Places a green circle of radius 39 at center (231, 116).
; PLAN: r0=262(x), r1=202(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=7(x1), r6=103(y1), r7=360(x2), r8=253(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=231(x), r11=116(y), r12=39(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 262
LDI r1, 202
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 7
LDI r6, 103
LDI r7, 360
LDI r8, 253
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 231
LDI r11, 116
LDI r12, 39
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
