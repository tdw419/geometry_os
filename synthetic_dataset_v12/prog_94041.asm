; DESCRIPTION: Draws a cyan line from (106, 202) to (443, 242).
; PLAN: r0=106(x1), r1=202(y1), r2=443(x2), r3=242(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 202
LDI r2, 443
LDI r3, 242
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
