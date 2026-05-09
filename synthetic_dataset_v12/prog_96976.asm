; DESCRIPTION: Draws a cyan line from (264, 41) to (470, 129).
; PLAN: r0=264(x1), r1=41(y1), r2=470(x2), r3=129(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 41
LDI r2, 470
LDI r3, 129
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
