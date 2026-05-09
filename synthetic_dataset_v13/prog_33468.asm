; DESCRIPTION: Draws a cyan line from (96, 242) to (290, 43).
; PLAN: r0=96(x1), r1=242(y1), r2=290(x2), r3=43(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 242
LDI r2, 290
LDI r3, 43
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
