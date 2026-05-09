; DESCRIPTION: Draws a cyan line from (241, 19) to (394, 1).
; PLAN: r0=241(x1), r1=19(y1), r2=394(x2), r3=1(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 19
LDI r2, 394
LDI r3, 1
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
