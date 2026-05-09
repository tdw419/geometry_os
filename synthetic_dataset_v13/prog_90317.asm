; DESCRIPTION: Draws a cyan line from (273, 242) to (208, 123).
; PLAN: r0=273(x1), r1=242(y1), r2=208(x2), r3=123(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 242
LDI r2, 208
LDI r3, 123
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
