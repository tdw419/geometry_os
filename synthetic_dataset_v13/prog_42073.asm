; DESCRIPTION: Draws a cyan line from (464, 59) to (35, 31).
; PLAN: r0=464(x1), r1=59(y1), r2=35(x2), r3=31(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 59
LDI r2, 35
LDI r3, 31
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
