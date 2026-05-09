; DESCRIPTION: Draws a cyan line from (151, 142) to (187, 130).
; PLAN: r0=151(x1), r1=142(y1), r2=187(x2), r3=130(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 142
LDI r2, 187
LDI r3, 130
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
