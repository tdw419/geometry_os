; DESCRIPTION: Draws a white line from (195, 138) to (255, 125).
; PLAN: r0=195(x1), r1=138(y1), r2=255(x2), r3=125(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 138
LDI r2, 255
LDI r3, 125
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
