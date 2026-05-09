; DESCRIPTION: Draws a white line from (127, 107) to (146, 240).
; PLAN: r0=127(x1), r1=107(y1), r2=146(x2), r3=240(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 107
LDI r2, 146
LDI r3, 240
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
