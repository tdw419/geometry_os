; DESCRIPTION: Draws a cyan line from (375, 146) to (170, 149).
; PLAN: r0=375(x1), r1=146(y1), r2=170(x2), r3=149(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 146
LDI r2, 170
LDI r3, 149
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
