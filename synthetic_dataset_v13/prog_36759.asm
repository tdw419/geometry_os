; DESCRIPTION: Draws a cyan line from (216, 205) to (101, 209).
; PLAN: r0=216(x1), r1=205(y1), r2=101(x2), r3=209(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 205
LDI r2, 101
LDI r3, 209
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
