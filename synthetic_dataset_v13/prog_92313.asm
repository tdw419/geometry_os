; DESCRIPTION: Draws a cyan line from (46, 159) to (507, 182).
; PLAN: r0=46(x1), r1=159(y1), r2=507(x2), r3=182(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 159
LDI r2, 507
LDI r3, 182
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
