; DESCRIPTION: Composite: Draws a red line from (301, 37) to (99, 187) then Renders a magenta disk with center (68, 71) and radius 53 then Places a blue dot at position (215, 64).
; PLAN: r0=301(x1), r1=37(y1), r2=99(x2), r3=187(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=68(x), r6=71(y), r7=53(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=215(x), r11=64(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 301
LDI r1, 37
LDI r2, 99
LDI r3, 187
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 68
LDI r6, 71
LDI r7, 53
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 215
LDI r11, 64
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
