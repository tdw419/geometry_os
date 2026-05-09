; DESCRIPTION: Draws a cyan line from (85, 57) to (262, 173).
; PLAN: r0=85(x1), r1=57(y1), r2=262(x2), r3=173(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 57
LDI r2, 262
LDI r3, 173
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
