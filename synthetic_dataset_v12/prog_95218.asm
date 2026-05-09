; DESCRIPTION: Draws a cyan line from (407, 239) to (106, 131).
; PLAN: r0=407(x1), r1=239(y1), r2=106(x2), r3=131(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 239
LDI r2, 106
LDI r3, 131
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
