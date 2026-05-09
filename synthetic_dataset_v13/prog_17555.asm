; DESCRIPTION: Draws a cyan line from (180, 59) to (118, 90).
; PLAN: r0=180(x1), r1=59(y1), r2=118(x2), r3=90(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 59
LDI r2, 118
LDI r3, 90
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
