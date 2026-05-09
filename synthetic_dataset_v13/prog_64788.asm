; DESCRIPTION: Renders a yellow line between points (392, 236) and (84, 231).
; PLAN: r0=392(x1), r1=236(y1), r2=84(x2), r3=231(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 236
LDI r2, 84
LDI r3, 231
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
