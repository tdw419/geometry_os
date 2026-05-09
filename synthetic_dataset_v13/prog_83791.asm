; DESCRIPTION: Renders a cyan line between points (438, 240) and (228, 168).
; PLAN: r0=438(x1), r1=240(y1), r2=228(x2), r3=168(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 240
LDI r2, 228
LDI r3, 168
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
