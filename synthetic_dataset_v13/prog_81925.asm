; DESCRIPTION: Draws a green line from (445, 118) to (277, 239).
; PLAN: r0=445(x1), r1=118(y1), r2=277(x2), r3=239(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 118
LDI r2, 277
LDI r3, 239
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
