; DESCRIPTION: Draws a cyan line from (111, 30) to (433, 162).
; PLAN: r0=111(x1), r1=30(y1), r2=433(x2), r3=162(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 30
LDI r2, 433
LDI r3, 162
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
