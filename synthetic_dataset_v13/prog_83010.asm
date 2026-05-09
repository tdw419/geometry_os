; DESCRIPTION: Draws a cyan line from (318, 90) to (487, 46).
; PLAN: r0=318(x1), r1=90(y1), r2=487(x2), r3=46(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 90
LDI r2, 487
LDI r3, 46
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
