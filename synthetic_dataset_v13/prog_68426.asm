; DESCRIPTION: Draws a cyan line from (498, 243) to (96, 113).
; PLAN: r0=498(x1), r1=243(y1), r2=96(x2), r3=113(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 243
LDI r2, 96
LDI r3, 113
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
