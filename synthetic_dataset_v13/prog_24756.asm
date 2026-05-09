; DESCRIPTION: Renders a cyan line between points (408, 168) and (91, 72).
; PLAN: r0=408(x1), r1=168(y1), r2=91(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 168
LDI r2, 91
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
