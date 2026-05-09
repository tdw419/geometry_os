; DESCRIPTION: Composite: Renders a cyan line between points (82, 70) and (383, 41) then Draws a black circle centered at (213, 166) with radius 16 then Places a magenta dot at position (431, 78).
; PLAN: r0=82(x1), r1=70(y1), r2=383(x2), r3=41(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=213(x), r6=166(y), r7=16(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=431(x), r11=78(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 82
LDI r1, 70
LDI r2, 383
LDI r3, 41
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 213
LDI r6, 166
LDI r7, 16
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 431
LDI r11, 78
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
