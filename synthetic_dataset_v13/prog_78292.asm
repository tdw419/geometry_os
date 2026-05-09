; DESCRIPTION: Draws a cyan line from (66, 73) to (74, 146).
; PLAN: r0=66(x1), r1=73(y1), r2=74(x2), r3=146(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 73
LDI r2, 74
LDI r3, 146
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
