; DESCRIPTION: Renders a green line between points (449, 3) and (439, 113).
; PLAN: r0=449(x1), r1=3(y1), r2=439(x2), r3=113(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 3
LDI r2, 439
LDI r3, 113
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
