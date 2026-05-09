; DESCRIPTION: Draws a cyan line from (275, 187) to (33, 93).
; PLAN: r0=275(x1), r1=187(y1), r2=33(x2), r3=93(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 187
LDI r2, 33
LDI r3, 93
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
