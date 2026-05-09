; DESCRIPTION: Draws a green line from (105, 111) to (226, 42).
; PLAN: r0=105(x1), r1=111(y1), r2=226(x2), r3=42(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 111
LDI r2, 226
LDI r3, 42
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
