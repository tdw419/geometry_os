; DESCRIPTION: Composite: Draws a green line from (127, 224) to (506, 59) then Places a orange dot at position (185, 150).
; PLAN: r0=127(x1), r1=224(y1), r2=506(x2), r3=59(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=185(x), r6=150(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 127
LDI r1, 224
LDI r2, 506
LDI r3, 59
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 150
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
