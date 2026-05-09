; DESCRIPTION: Composite: Draws a magenta circle centered at (198, 113) with radius 64 then Renders a cyan line between points (182, 36) and (156, 71) then Places a orange dot at position (287, 233).
; PLAN: r0=198(x), r1=113(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=182(x1), r6=36(y1), r7=156(x2), r8=71(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=287(x), r11=233(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 198
LDI r1, 113
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 182
LDI r6, 36
LDI r7, 156
LDI r8, 71
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 287
LDI r11, 233
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
