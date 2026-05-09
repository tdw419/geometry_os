; DESCRIPTION: Renders a cyan line between points (78, 103) and (206, 231).
; PLAN: r0=78(x1), r1=103(y1), r2=206(x2), r3=231(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 103
LDI r2, 206
LDI r3, 231
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
