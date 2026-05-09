; DESCRIPTION: Draws a cyan line from (222, 146) to (468, 48).
; PLAN: r0=222(x1), r1=146(y1), r2=468(x2), r3=48(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 146
LDI r2, 468
LDI r3, 48
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
