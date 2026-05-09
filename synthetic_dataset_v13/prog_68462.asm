; DESCRIPTION: Renders a white line between points (370, 22) and (445, 113).
; PLAN: r0=370(x1), r1=22(y1), r2=445(x2), r3=113(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 22
LDI r2, 445
LDI r3, 113
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
