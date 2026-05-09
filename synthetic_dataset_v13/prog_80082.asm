; DESCRIPTION: Draws a cyan line from (170, 231) to (436, 0).
; PLAN: r0=170(x1), r1=231(y1), r2=436(x2), r3=0(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 231
LDI r2, 436
LDI r3, 0
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
