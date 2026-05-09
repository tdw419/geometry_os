; DESCRIPTION: Draws a red line from (326, 243) to (288, 215).
; PLAN: r0=326(x1), r1=243(y1), r2=288(x2), r3=215(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 243
LDI r2, 288
LDI r3, 215
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
