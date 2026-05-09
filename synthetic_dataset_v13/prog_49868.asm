; DESCRIPTION: Draws a cyan line from (409, 71) to (437, 28).
; PLAN: r0=409(x1), r1=71(y1), r2=437(x2), r3=28(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 71
LDI r2, 437
LDI r3, 28
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
