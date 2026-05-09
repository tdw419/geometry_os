; DESCRIPTION: Draws a cyan line from (104, 135) to (117, 43).
; PLAN: r0=104(x1), r1=135(y1), r2=117(x2), r3=43(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 135
LDI r2, 117
LDI r3, 43
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
