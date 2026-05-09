; DESCRIPTION: Draws a cyan line from (53, 39) to (385, 250).
; PLAN: r0=53(x1), r1=39(y1), r2=385(x2), r3=250(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 39
LDI r2, 385
LDI r3, 250
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
