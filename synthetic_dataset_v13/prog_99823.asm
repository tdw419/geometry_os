; DESCRIPTION: Draws a cyan line from (120, 18) to (267, 162).
; PLAN: r0=120(x1), r1=18(y1), r2=267(x2), r3=162(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 18
LDI r2, 267
LDI r3, 162
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
