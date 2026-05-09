; DESCRIPTION: Composite: Places a black dot at position (19, 222) then Draws a white line from (275, 19) to (510, 132).
; PLAN: r0=19(x), r1=222(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=275(x1), r6=19(y1), r7=510(x2), r8=132(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 19
LDI r1, 222
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 275
LDI r6, 19
LDI r7, 510
LDI r8, 132
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
