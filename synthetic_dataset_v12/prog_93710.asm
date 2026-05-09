; DESCRIPTION: Draws a cyan line from (494, 175) to (310, 185).
; PLAN: r0=494(x1), r1=175(y1), r2=310(x2), r3=185(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 175
LDI r2, 310
LDI r3, 185
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
