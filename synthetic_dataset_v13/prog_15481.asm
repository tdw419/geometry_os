; DESCRIPTION: Renders a cyan line between points (420, 231) and (84, 224).
; PLAN: r0=420(x1), r1=231(y1), r2=84(x2), r3=224(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 231
LDI r2, 84
LDI r3, 224
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
