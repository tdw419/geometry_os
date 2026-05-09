; DESCRIPTION: Draws a cyan line from (379, 119) to (367, 164).
; PLAN: r0=379(x1), r1=119(y1), r2=367(x2), r3=164(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 119
LDI r2, 367
LDI r3, 164
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
