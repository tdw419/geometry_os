; DESCRIPTION: Draws a cyan line from (154, 212) to (170, 22).
; PLAN: r0=154(x1), r1=212(y1), r2=170(x2), r3=22(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 212
LDI r2, 170
LDI r3, 22
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
