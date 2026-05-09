; DESCRIPTION: Composite: Draws a magenta line from (210, 101) to (1, 167) then Places a white dot at position (442, 193).
; PLAN: r0=210(x1), r1=101(y1), r2=1(x2), r3=167(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=442(x), r6=193(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 210
LDI r1, 101
LDI r2, 1
LDI r3, 167
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 193
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
