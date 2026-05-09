; DESCRIPTION: Draws a cyan line from (96, 140) to (482, 180).
; PLAN: r0=96(x1), r1=140(y1), r2=482(x2), r3=180(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 140
LDI r2, 482
LDI r3, 180
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
