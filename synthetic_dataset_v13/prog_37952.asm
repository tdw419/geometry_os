; DESCRIPTION: Draws a cyan line from (303, 174) to (247, 107).
; PLAN: r0=303(x1), r1=174(y1), r2=247(x2), r3=107(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 174
LDI r2, 247
LDI r3, 107
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
