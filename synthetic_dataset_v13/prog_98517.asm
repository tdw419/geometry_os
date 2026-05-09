; DESCRIPTION: Renders a red line between points (394, 92) and (305, 236).
; PLAN: r0=394(x1), r1=92(y1), r2=305(x2), r3=236(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 92
LDI r2, 305
LDI r3, 236
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
