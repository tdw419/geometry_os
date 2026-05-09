; DESCRIPTION: Draws a cyan line from (206, 33) to (282, 193).
; PLAN: r0=206(x1), r1=33(y1), r2=282(x2), r3=193(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 33
LDI r2, 282
LDI r3, 193
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
