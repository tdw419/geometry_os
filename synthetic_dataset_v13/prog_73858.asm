; DESCRIPTION: Renders a cyan line between points (307, 221) and (85, 183).
; PLAN: r0=307(x1), r1=221(y1), r2=85(x2), r3=183(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 221
LDI r2, 85
LDI r3, 183
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
