; DESCRIPTION: Renders a red line between points (131, 29) and (295, 231).
; PLAN: r0=131(x1), r1=29(y1), r2=295(x2), r3=231(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 29
LDI r2, 295
LDI r3, 231
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
