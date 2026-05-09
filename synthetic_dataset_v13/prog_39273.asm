; DESCRIPTION: Draws a yellow line from (243, 98) to (33, 173).
; PLAN: r0=243(x1), r1=98(y1), r2=33(x2), r3=173(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 98
LDI r2, 33
LDI r3, 173
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
