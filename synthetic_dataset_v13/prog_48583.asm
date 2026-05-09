; DESCRIPTION: Renders a cyan line between points (280, 97) and (35, 178).
; PLAN: r0=280(x1), r1=97(y1), r2=35(x2), r3=178(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 97
LDI r2, 35
LDI r3, 178
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
