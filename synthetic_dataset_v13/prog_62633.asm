; DESCRIPTION: Draws a cyan line from (295, 106) to (448, 210).
; PLAN: r0=295(x1), r1=106(y1), r2=448(x2), r3=210(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 106
LDI r2, 448
LDI r3, 210
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
