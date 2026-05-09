; DESCRIPTION: Draws a white line from (344, 250) to (242, 193).
; PLAN: r0=344(x1), r1=250(y1), r2=242(x2), r3=193(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 250
LDI r2, 242
LDI r3, 193
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
