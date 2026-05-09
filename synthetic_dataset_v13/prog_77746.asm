; DESCRIPTION: Draws a cyan line from (103, 168) to (272, 177).
; PLAN: r0=103(x1), r1=168(y1), r2=272(x2), r3=177(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 168
LDI r2, 272
LDI r3, 177
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
