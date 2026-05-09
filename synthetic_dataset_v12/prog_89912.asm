; DESCRIPTION: Composite: Draws a cyan line from (52, 164) to (419, 144) then Draws a magenta circle centered at (389, 114) with radius 55 then Places a red dot at position (346, 193).
; PLAN: r0=52(x1), r1=164(y1), r2=419(x2), r3=144(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=389(x), r6=114(y), r7=55(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=346(x), r11=193(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 52
LDI r1, 164
LDI r2, 419
LDI r3, 144
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 389
LDI r6, 114
LDI r7, 55
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 346
LDI r11, 193
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
