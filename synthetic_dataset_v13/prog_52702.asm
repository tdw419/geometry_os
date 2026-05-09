; DESCRIPTION: Draws a cyan line from (496, 70) to (354, 51).
; PLAN: r0=496(x1), r1=70(y1), r2=354(x2), r3=51(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 70
LDI r2, 354
LDI r3, 51
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
