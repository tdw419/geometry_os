; DESCRIPTION: Renders a cyan line between points (277, 0) and (389, 166).
; PLAN: r0=277(x1), r1=0(y1), r2=389(x2), r3=166(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 0
LDI r2, 389
LDI r3, 166
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
