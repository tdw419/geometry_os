; DESCRIPTION: Composite: Places a red dot at position (146, 125) then Renders a blue box of size 106x46 starting at (302, 32) then Places a white line segment connecting (257, 95) to (454, 237).
; PLAN: r0=146(x), r1=125(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=302(x), r6=32(y), r7=106(width), r8=46(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=257(x1), r11=95(y1), r12=454(x2), r13=237(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 146
LDI r1, 125
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 302
LDI r6, 32
LDI r7, 106
LDI r8, 46
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 257
LDI r11, 95
LDI r12, 454
LDI r13, 237
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
