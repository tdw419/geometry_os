; DESCRIPTION: Draws a cyan line from (68, 149) to (477, 208).
; PLAN: r0=68(x1), r1=149(y1), r2=477(x2), r3=208(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 149
LDI r2, 477
LDI r3, 208
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
