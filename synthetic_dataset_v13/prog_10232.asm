; DESCRIPTION: Draws a cyan line from (60, 71) to (161, 76).
; PLAN: r0=60(x1), r1=71(y1), r2=161(x2), r3=76(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 71
LDI r2, 161
LDI r3, 76
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
