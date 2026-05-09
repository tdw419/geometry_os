; DESCRIPTION: Draws a cyan line from (30, 202) to (10, 223).
; PLAN: r0=30(x1), r1=202(y1), r2=10(x2), r3=223(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 202
LDI r2, 10
LDI r3, 223
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
