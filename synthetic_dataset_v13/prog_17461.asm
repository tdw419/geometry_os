; DESCRIPTION: Draws a cyan line from (330, 110) to (330, 195).
; PLAN: r0=330(x1), r1=110(y1), r2=330(x2), r3=195(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 110
LDI r2, 330
LDI r3, 195
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
