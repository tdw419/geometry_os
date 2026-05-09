; DESCRIPTION: Renders a white line between points (277, 65) and (380, 239).
; PLAN: r0=277(x1), r1=65(y1), r2=380(x2), r3=239(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 65
LDI r2, 380
LDI r3, 239
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
