; DESCRIPTION: Draws a green line from (286, 182) to (394, 142).
; PLAN: r0=286(x1), r1=182(y1), r2=394(x2), r3=142(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 182
LDI r2, 394
LDI r3, 142
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
