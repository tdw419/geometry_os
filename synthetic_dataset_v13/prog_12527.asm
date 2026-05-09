; DESCRIPTION: Renders a green line between points (74, 231) and (152, 126).
; PLAN: r0=74(x1), r1=231(y1), r2=152(x2), r3=126(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 231
LDI r2, 152
LDI r3, 126
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
