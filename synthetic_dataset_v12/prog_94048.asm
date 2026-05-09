; DESCRIPTION: Draws a green line from (149, 42) to (226, 178).
; PLAN: r0=149(x1), r1=42(y1), r2=226(x2), r3=178(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 42
LDI r2, 226
LDI r3, 178
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
