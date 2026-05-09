; DESCRIPTION: Renders a green line between points (465, 221) and (96, 95).
; PLAN: r0=465(x1), r1=221(y1), r2=96(x2), r3=95(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 221
LDI r2, 96
LDI r3, 95
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
