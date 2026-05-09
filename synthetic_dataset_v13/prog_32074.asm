; DESCRIPTION: Renders a cyan line between points (61, 146) and (454, 92).
; PLAN: r0=61(x1), r1=146(y1), r2=454(x2), r3=92(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 146
LDI r2, 454
LDI r3, 92
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
