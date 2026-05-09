; DESCRIPTION: Composite: Draws a white line from (251, 132) to (313, 224) then Places a orange dot at position (298, 210).
; PLAN: r0=251(x1), r1=132(y1), r2=313(x2), r3=224(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=298(x), r6=210(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 251
LDI r1, 132
LDI r2, 313
LDI r3, 224
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 298
LDI r6, 210
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
