; DESCRIPTION: Renders a cyan line between points (57, 95) and (337, 236).
; PLAN: r0=57(x1), r1=95(y1), r2=337(x2), r3=236(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 95
LDI r2, 337
LDI r3, 236
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
