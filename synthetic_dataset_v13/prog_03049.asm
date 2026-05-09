; DESCRIPTION: Draws a cyan line from (273, 212) to (450, 223).
; PLAN: r0=273(x1), r1=212(y1), r2=450(x2), r3=223(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 212
LDI r2, 450
LDI r3, 223
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
