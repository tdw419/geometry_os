; DESCRIPTION: Composite: Places a black dot at position (508, 64) then Renders a magenta line between points (302, 81) and (70, 20) then Places a purple 53x30 rectangle at position (367, 184).
; PLAN: r0=508(x), r1=64(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=302(x1), r6=81(y1), r7=70(x2), r8=20(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=367(x), r11=184(y), r12=53(width), r13=30(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 508
LDI r1, 64
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 302
LDI r6, 81
LDI r7, 70
LDI r8, 20
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 367
LDI r11, 184
LDI r12, 53
LDI r13, 30
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
