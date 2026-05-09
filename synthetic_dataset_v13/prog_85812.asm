; DESCRIPTION: Draws a cyan line from (103, 202) to (31, 108).
; PLAN: r0=103(x1), r1=202(y1), r2=31(x2), r3=108(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 202
LDI r2, 31
LDI r3, 108
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
