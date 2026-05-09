; DESCRIPTION: Draws a white line from (277, 28) to (446, 143).
; PLAN: r0=277(x1), r1=28(y1), r2=446(x2), r3=143(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 28
LDI r2, 446
LDI r3, 143
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
