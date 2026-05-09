; DESCRIPTION: Draws a green line from (171, 151) to (129, 42).
; PLAN: r0=171(x1), r1=151(y1), r2=129(x2), r3=42(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 151
LDI r2, 129
LDI r3, 42
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
