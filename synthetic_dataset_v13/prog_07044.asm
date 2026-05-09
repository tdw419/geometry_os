; DESCRIPTION: Composite: Draws a blue line from (464, 175) to (379, 223) then Places a white dot at position (343, 225).
; PLAN: r0=464(x1), r1=175(y1), r2=379(x2), r3=223(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=343(x), r6=225(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 464
LDI r1, 175
LDI r2, 379
LDI r3, 223
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 343
LDI r6, 225
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
