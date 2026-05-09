; DESCRIPTION: Draws a cyan line from (193, 81) to (175, 215).
; PLAN: r0=193(x1), r1=81(y1), r2=175(x2), r3=215(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 81
LDI r2, 175
LDI r3, 215
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
