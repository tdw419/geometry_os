; DESCRIPTION: Draws a cyan line from (498, 22) to (150, 33).
; PLAN: r0=498(x1), r1=22(y1), r2=150(x2), r3=33(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 22
LDI r2, 150
LDI r3, 33
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
