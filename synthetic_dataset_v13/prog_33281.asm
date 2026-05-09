; DESCRIPTION: Composite: Draws a white line from (62, 27) to (431, 213) then Places a cyan dot at position (109, 11).
; PLAN: r0=62(x1), r1=27(y1), r2=431(x2), r3=213(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=109(x), r6=11(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 62
LDI r1, 27
LDI r2, 431
LDI r3, 213
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 109
LDI r6, 11
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
