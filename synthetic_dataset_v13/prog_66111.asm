; DESCRIPTION: Draws a cyan line from (67, 51) to (405, 98).
; PLAN: r0=67(x1), r1=51(y1), r2=405(x2), r3=98(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 51
LDI r2, 405
LDI r3, 98
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
