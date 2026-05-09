; DESCRIPTION: Draws a magenta line from (398, 31) to (295, 89).
; PLAN: r0=398(x1), r1=31(y1), r2=295(x2), r3=89(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 31
LDI r2, 295
LDI r3, 89
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
