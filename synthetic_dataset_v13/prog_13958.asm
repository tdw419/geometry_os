; DESCRIPTION: Composite: Draws a orange line from (386, 228) to (312, 222) then Places a green dot at position (174, 49).
; PLAN: r0=386(x1), r1=228(y1), r2=312(x2), r3=222(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=174(x), r6=49(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 386
LDI r1, 228
LDI r2, 312
LDI r3, 222
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 174
LDI r6, 49
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
