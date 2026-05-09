; DESCRIPTION: Renders a white line between points (329, 206) and (445, 49).
; PLAN: r0=329(x1), r1=206(y1), r2=445(x2), r3=49(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 206
LDI r2, 445
LDI r3, 49
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
