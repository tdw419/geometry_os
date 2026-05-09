; DESCRIPTION: Draws a cyan line from (61, 87) to (465, 146).
; PLAN: r0=61(x1), r1=87(y1), r2=465(x2), r3=146(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 87
LDI r2, 465
LDI r3, 146
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
