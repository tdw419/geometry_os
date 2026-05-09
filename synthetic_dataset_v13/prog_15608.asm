; DESCRIPTION: Draws a cyan line from (502, 221) to (367, 149).
; PLAN: r0=502(x1), r1=221(y1), r2=367(x2), r3=149(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 221
LDI r2, 367
LDI r3, 149
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
