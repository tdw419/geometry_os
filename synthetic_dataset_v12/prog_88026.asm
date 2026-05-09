; DESCRIPTION: Draws a cyan line from (65, 12) to (370, 10).
; PLAN: r0=65(x1), r1=12(y1), r2=370(x2), r3=10(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 12
LDI r2, 370
LDI r3, 10
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
