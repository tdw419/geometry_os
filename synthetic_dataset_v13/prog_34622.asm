; DESCRIPTION: Composite: Draws a magenta line from (172, 202) to (459, 69) then Places a blue dot at position (233, 231).
; PLAN: r0=172(x1), r1=202(y1), r2=459(x2), r3=69(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=233(x), r6=231(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 172
LDI r1, 202
LDI r2, 459
LDI r3, 69
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 233
LDI r6, 231
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
