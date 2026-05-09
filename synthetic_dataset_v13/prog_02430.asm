; DESCRIPTION: Draws a cyan line from (487, 251) to (130, 62).
; PLAN: r0=487(x1), r1=251(y1), r2=130(x2), r3=62(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 251
LDI r2, 130
LDI r3, 62
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
