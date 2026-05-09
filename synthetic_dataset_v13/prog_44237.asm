; DESCRIPTION: Draws a cyan line from (420, 131) to (472, 108).
; PLAN: r0=420(x1), r1=131(y1), r2=472(x2), r3=108(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 131
LDI r2, 472
LDI r3, 108
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
