; DESCRIPTION: Renders a cyan line between points (359, 69) and (5, 27).
; PLAN: r0=359(x1), r1=69(y1), r2=5(x2), r3=27(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 69
LDI r2, 5
LDI r3, 27
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
