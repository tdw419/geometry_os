; DESCRIPTION: Composite: Draws a black line from (294, 41) to (229, 222) then Places a blue dot at position (57, 22).
; PLAN: r0=294(x1), r1=41(y1), r2=229(x2), r3=222(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=57(x), r6=22(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 294
LDI r1, 41
LDI r2, 229
LDI r3, 222
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 57
LDI r6, 22
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
