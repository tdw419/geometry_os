; DESCRIPTION: Draws a cyan line from (134, 95) to (302, 213).
; PLAN: r0=134(x1), r1=95(y1), r2=302(x2), r3=213(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 95
LDI r2, 302
LDI r3, 213
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
