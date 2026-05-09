; DESCRIPTION: Draws a white line from (367, 98) to (127, 149).
; PLAN: r0=367(x1), r1=98(y1), r2=127(x2), r3=149(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 98
LDI r2, 127
LDI r3, 149
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
