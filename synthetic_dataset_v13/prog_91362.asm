; DESCRIPTION: Renders a white line between points (449, 162) and (154, 132).
; PLAN: r0=449(x1), r1=162(y1), r2=154(x2), r3=132(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 162
LDI r2, 154
LDI r3, 132
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
