; DESCRIPTION: Draws a cyan line from (262, 189) to (344, 181).
; PLAN: r0=262(x1), r1=189(y1), r2=344(x2), r3=181(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 189
LDI r2, 344
LDI r3, 181
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
