; DESCRIPTION: Renders a cyan line between points (156, 176) and (300, 103).
; PLAN: r0=156(x1), r1=176(y1), r2=300(x2), r3=103(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 176
LDI r2, 300
LDI r3, 103
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
