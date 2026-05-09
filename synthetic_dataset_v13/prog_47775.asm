; DESCRIPTION: Composite: Draws a cyan line from (415, 88) to (321, 41) then Places a yellow dot at position (24, 79).
; PLAN: r0=415(x1), r1=88(y1), r2=321(x2), r3=41(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=24(x), r6=79(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 415
LDI r1, 88
LDI r2, 321
LDI r3, 41
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 24
LDI r6, 79
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
