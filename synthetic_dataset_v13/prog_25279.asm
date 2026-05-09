; DESCRIPTION: Composite: Draws a magenta line from (12, 55) to (165, 33) then Places a white dot at position (500, 227).
; PLAN: r0=12(x1), r1=55(y1), r2=165(x2), r3=33(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=500(x), r6=227(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 12
LDI r1, 55
LDI r2, 165
LDI r3, 33
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 500
LDI r6, 227
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
