; DESCRIPTION: Draws a cyan line from (108, 136) to (64, 225).
; PLAN: r0=108(x1), r1=136(y1), r2=64(x2), r3=225(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 136
LDI r2, 64
LDI r3, 225
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
