; DESCRIPTION: Draws a cyan line from (300, 136) to (480, 221).
; PLAN: r0=300(x1), r1=136(y1), r2=480(x2), r3=221(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 136
LDI r2, 480
LDI r3, 221
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
