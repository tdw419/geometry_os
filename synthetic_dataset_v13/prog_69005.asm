; DESCRIPTION: Draws a green line from (38, 64) to (499, 243).
; PLAN: r0=38(x1), r1=64(y1), r2=499(x2), r3=243(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 64
LDI r2, 499
LDI r3, 243
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
