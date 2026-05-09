; DESCRIPTION: Renders a cyan line between points (451, 245) and (392, 37).
; PLAN: r0=451(x1), r1=245(y1), r2=392(x2), r3=37(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 245
LDI r2, 392
LDI r3, 37
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
