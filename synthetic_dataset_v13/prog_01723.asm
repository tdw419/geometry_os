; DESCRIPTION: Draws a white line from (110, 82) to (156, 113).
; PLAN: r0=110(x1), r1=82(y1), r2=156(x2), r3=113(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 82
LDI r2, 156
LDI r3, 113
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
