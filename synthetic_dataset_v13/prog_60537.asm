; DESCRIPTION: Places a cyan line segment connecting (172, 93) to (305, 214).
; PLAN: r0=172(x1), r1=93(y1), r2=305(x2), r3=214(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 93
LDI r2, 305
LDI r3, 214
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
