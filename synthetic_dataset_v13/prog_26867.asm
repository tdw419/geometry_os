; DESCRIPTION: Draws a cyan line from (399, 32) to (286, 177).
; PLAN: r0=399(x1), r1=32(y1), r2=286(x2), r3=177(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 32
LDI r2, 286
LDI r3, 177
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
