; DESCRIPTION: Renders a cyan line between points (474, 154) and (166, 157).
; PLAN: r0=474(x1), r1=154(y1), r2=166(x2), r3=157(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 154
LDI r2, 166
LDI r3, 157
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
