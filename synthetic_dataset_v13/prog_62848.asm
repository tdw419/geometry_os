; DESCRIPTION: Draws a cyan line from (38, 154) to (95, 15).
; PLAN: r0=38(x1), r1=154(y1), r2=95(x2), r3=15(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 154
LDI r2, 95
LDI r3, 15
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
