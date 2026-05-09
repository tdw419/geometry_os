; DESCRIPTION: Draws a cyan line from (202, 94) to (306, 196).
; PLAN: r0=202(x1), r1=94(y1), r2=306(x2), r3=196(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 94
LDI r2, 306
LDI r3, 196
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
