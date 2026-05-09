; DESCRIPTION: Draws a cyan line from (425, 84) to (26, 59).
; PLAN: r0=425(x1), r1=84(y1), r2=26(x2), r3=59(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 84
LDI r2, 26
LDI r3, 59
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
