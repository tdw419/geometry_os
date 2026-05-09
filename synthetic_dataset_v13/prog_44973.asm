; DESCRIPTION: Draws a cyan line from (175, 146) to (17, 2).
; PLAN: r0=175(x1), r1=146(y1), r2=17(x2), r3=2(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 146
LDI r2, 17
LDI r3, 2
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
