; DESCRIPTION: Renders a green line between points (179, 220) and (401, 166).
; PLAN: r0=179(x1), r1=220(y1), r2=401(x2), r3=166(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 220
LDI r2, 401
LDI r3, 166
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
