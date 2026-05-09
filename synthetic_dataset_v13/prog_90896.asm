; DESCRIPTION: Draws a cyan line from (148, 136) to (307, 161).
; PLAN: r0=148(x1), r1=136(y1), r2=307(x2), r3=161(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 136
LDI r2, 307
LDI r3, 161
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
