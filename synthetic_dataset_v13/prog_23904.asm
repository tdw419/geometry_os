; DESCRIPTION: Draws a cyan line from (4, 205) to (106, 196).
; PLAN: r0=4(x1), r1=205(y1), r2=106(x2), r3=196(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 205
LDI r2, 106
LDI r3, 196
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
