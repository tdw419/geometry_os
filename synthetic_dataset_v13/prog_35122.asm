; DESCRIPTION: Draws a cyan line from (134, 244) to (327, 131).
; PLAN: r0=134(x1), r1=244(y1), r2=327(x2), r3=131(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 244
LDI r2, 327
LDI r3, 131
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
