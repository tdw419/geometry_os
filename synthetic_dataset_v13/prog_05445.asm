; DESCRIPTION: Draws a cyan line from (304, 93) to (386, 92).
; PLAN: r0=304(x1), r1=93(y1), r2=386(x2), r3=92(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 93
LDI r2, 386
LDI r3, 92
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
