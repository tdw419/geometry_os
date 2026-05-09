; DESCRIPTION: Composite: Draws a cyan line from (65, 122) to (420, 189) then Places a red dot at position (84, 8).
; PLAN: r0=65(x1), r1=122(y1), r2=420(x2), r3=189(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=84(x), r6=8(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 65
LDI r1, 122
LDI r2, 420
LDI r3, 189
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 84
LDI r6, 8
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
