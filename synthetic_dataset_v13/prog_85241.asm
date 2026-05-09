; DESCRIPTION: Draws a cyan line from (70, 228) to (93, 1).
; PLAN: r0=70(x1), r1=228(y1), r2=93(x2), r3=1(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 228
LDI r2, 93
LDI r3, 1
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
