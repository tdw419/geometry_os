; DESCRIPTION: Draws a white line from (309, 222) to (154, 107).
; PLAN: r0=309(x1), r1=222(y1), r2=154(x2), r3=107(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 222
LDI r2, 154
LDI r3, 107
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
