; DESCRIPTION: Renders a cyan line between points (278, 131) and (198, 146).
; PLAN: r0=278(x1), r1=131(y1), r2=198(x2), r3=146(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 131
LDI r2, 198
LDI r3, 146
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
