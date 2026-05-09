; DESCRIPTION: Draws a white line from (483, 178) to (42, 171).
; PLAN: r0=483(x1), r1=178(y1), r2=42(x2), r3=171(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 178
LDI r2, 42
LDI r3, 171
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
