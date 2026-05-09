; DESCRIPTION: Draws a cyan line from (288, 234) to (487, 79).
; PLAN: r0=288(x1), r1=234(y1), r2=487(x2), r3=79(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 234
LDI r2, 487
LDI r3, 79
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
