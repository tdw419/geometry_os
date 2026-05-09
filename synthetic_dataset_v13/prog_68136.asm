; DESCRIPTION: Draws a cyan line from (375, 21) to (45, 250).
; PLAN: r0=375(x1), r1=21(y1), r2=45(x2), r3=250(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 21
LDI r2, 45
LDI r3, 250
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
