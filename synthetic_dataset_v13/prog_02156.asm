; DESCRIPTION: Draws a cyan line from (169, 221) to (220, 91).
; PLAN: r0=169(x1), r1=221(y1), r2=220(x2), r3=91(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 221
LDI r2, 220
LDI r3, 91
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
