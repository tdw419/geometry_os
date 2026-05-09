; DESCRIPTION: Draws a white line from (305, 146) to (439, 197).
; PLAN: r0=305(x1), r1=146(y1), r2=439(x2), r3=197(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 146
LDI r2, 439
LDI r3, 197
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
