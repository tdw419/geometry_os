; DESCRIPTION: Renders a cyan line between points (383, 234) and (155, 228).
; PLAN: r0=383(x1), r1=234(y1), r2=155(x2), r3=228(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 234
LDI r2, 155
LDI r3, 228
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
