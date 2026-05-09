; DESCRIPTION: Draws a cyan line from (494, 232) to (382, 5).
; PLAN: r0=494(x1), r1=232(y1), r2=382(x2), r3=5(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 232
LDI r2, 382
LDI r3, 5
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
