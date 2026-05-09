; DESCRIPTION: Draws a cyan line from (240, 146) to (364, 112).
; PLAN: r0=240(x1), r1=146(y1), r2=364(x2), r3=112(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 146
LDI r2, 364
LDI r3, 112
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
