; DESCRIPTION: Draws a cyan line from (36, 82) to (210, 164).
; PLAN: r0=36(x1), r1=82(y1), r2=210(x2), r3=164(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 82
LDI r2, 210
LDI r3, 164
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
