; DESCRIPTION: Draws a cyan line from (286, 150) to (305, 186).
; PLAN: r0=286(x1), r1=150(y1), r2=305(x2), r3=186(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 150
LDI r2, 305
LDI r3, 186
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
