; DESCRIPTION: Draws a white line from (494, 108) to (49, 154).
; PLAN: r0=494(x1), r1=108(y1), r2=49(x2), r3=154(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 108
LDI r2, 49
LDI r3, 154
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
