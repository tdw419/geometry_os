; DESCRIPTION: Draws a white line from (445, 247) to (162, 213).
; PLAN: r0=445(x1), r1=247(y1), r2=162(x2), r3=213(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 247
LDI r2, 162
LDI r3, 213
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
