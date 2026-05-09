; DESCRIPTION: Draws a green line from (187, 93) to (183, 59).
; PLAN: r0=187(x1), r1=93(y1), r2=183(x2), r3=59(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 93
LDI r2, 183
LDI r3, 59
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
