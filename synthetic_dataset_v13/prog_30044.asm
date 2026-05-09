; DESCRIPTION: Draws a cyan line from (177, 221) to (411, 83).
; PLAN: r0=177(x1), r1=221(y1), r2=411(x2), r3=83(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 221
LDI r2, 411
LDI r3, 83
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
