; DESCRIPTION: Draws a cyan line from (156, 159) to (487, 61).
; PLAN: r0=156(x1), r1=159(y1), r2=487(x2), r3=61(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 159
LDI r2, 487
LDI r3, 61
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
