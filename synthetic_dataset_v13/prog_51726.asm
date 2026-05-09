; DESCRIPTION: Draws a cyan line from (223, 209) to (475, 69).
; PLAN: r0=223(x1), r1=209(y1), r2=475(x2), r3=69(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 209
LDI r2, 475
LDI r3, 69
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
