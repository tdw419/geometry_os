; DESCRIPTION: Draws a cyan line from (91, 24) to (138, 107).
; PLAN: r0=91(x1), r1=24(y1), r2=138(x2), r3=107(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 24
LDI r2, 138
LDI r3, 107
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
