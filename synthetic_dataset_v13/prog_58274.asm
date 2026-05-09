; DESCRIPTION: Composite: Draws a magenta line from (108, 206) to (55, 255) then Renders a purple disk with center (343, 166) and radius 71 then Places a magenta dot at position (82, 123).
; PLAN: r0=108(x1), r1=206(y1), r2=55(x2), r3=255(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=343(x), r6=166(y), r7=71(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=82(x), r11=123(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 108
LDI r1, 206
LDI r2, 55
LDI r3, 255
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 343
LDI r6, 166
LDI r7, 71
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 82
LDI r11, 123
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
