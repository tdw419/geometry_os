; DESCRIPTION: Draws a cyan line from (156, 151) to (304, 118).
; PLAN: r0=156(x1), r1=151(y1), r2=304(x2), r3=118(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 151
LDI r2, 304
LDI r3, 118
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
