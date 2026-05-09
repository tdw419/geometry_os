; DESCRIPTION: Composite: Renders a magenta line between points (135, 248) and (385, 243) then Places a white dot at position (114, 64).
; PLAN: r0=135(x1), r1=248(y1), r2=385(x2), r3=243(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=114(x), r6=64(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 135
LDI r1, 248
LDI r2, 385
LDI r3, 243
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 114
LDI r6, 64
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
