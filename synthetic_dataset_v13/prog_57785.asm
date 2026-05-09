; DESCRIPTION: Draws a cyan line from (152, 220) to (2, 66).
; PLAN: r0=152(x1), r1=220(y1), r2=2(x2), r3=66(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 220
LDI r2, 2
LDI r3, 66
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
