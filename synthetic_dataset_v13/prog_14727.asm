; DESCRIPTION: Draws a green line from (345, 154) to (217, 125).
; PLAN: r0=345(x1), r1=154(y1), r2=217(x2), r3=125(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 154
LDI r2, 217
LDI r3, 125
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
