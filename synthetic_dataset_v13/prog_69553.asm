; DESCRIPTION: Composite: Draws a cyan line from (210, 204) to (393, 28) then Places a orange dot at position (86, 49).
; PLAN: r0=210(x1), r1=204(y1), r2=393(x2), r3=28(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=86(x), r6=49(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 210
LDI r1, 204
LDI r2, 393
LDI r3, 28
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 86
LDI r6, 49
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
