; DESCRIPTION: Composite: Draws a orange line from (51, 79) to (76, 243) then Places a cyan circle of radius 37 at center (281, 158).
; PLAN: r0=51(x1), r1=79(y1), r2=76(x2), r3=243(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=281(x), r6=158(y), r7=37(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 51
LDI r1, 79
LDI r2, 76
LDI r3, 243
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 158
LDI r7, 37
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
