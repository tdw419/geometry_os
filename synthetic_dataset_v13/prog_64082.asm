; DESCRIPTION: Draws a cyan line from (454, 53) to (391, 210).
; PLAN: r0=454(x1), r1=53(y1), r2=391(x2), r3=210(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 53
LDI r2, 391
LDI r3, 210
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
