; DESCRIPTION: Renders a cyan line between points (168, 102) and (24, 50).
; PLAN: r0=168(x1), r1=102(y1), r2=24(x2), r3=50(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 102
LDI r2, 24
LDI r3, 50
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
