; DESCRIPTION: Draws a cyan line from (243, 153) to (185, 83).
; PLAN: r0=243(x1), r1=153(y1), r2=185(x2), r3=83(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 153
LDI r2, 185
LDI r3, 83
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
