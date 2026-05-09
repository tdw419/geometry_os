; DESCRIPTION: Draws a cyan line from (286, 178) to (167, 234).
; PLAN: r0=286(x1), r1=178(y1), r2=167(x2), r3=234(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 178
LDI r2, 167
LDI r3, 234
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
