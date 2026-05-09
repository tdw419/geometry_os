; DESCRIPTION: Draws a cyan line from (436, 53) to (268, 160).
; PLAN: r0=436(x1), r1=53(y1), r2=268(x2), r3=160(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 53
LDI r2, 268
LDI r3, 160
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
