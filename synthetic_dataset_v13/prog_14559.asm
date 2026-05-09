; DESCRIPTION: Draws a white line from (220, 146) to (405, 132).
; PLAN: r0=220(x1), r1=146(y1), r2=405(x2), r3=132(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 146
LDI r2, 405
LDI r3, 132
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
