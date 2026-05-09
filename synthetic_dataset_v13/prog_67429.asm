; DESCRIPTION: Draws a cyan line from (406, 115) to (32, 177).
; PLAN: r0=406(x1), r1=115(y1), r2=32(x2), r3=177(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 115
LDI r2, 32
LDI r3, 177
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
