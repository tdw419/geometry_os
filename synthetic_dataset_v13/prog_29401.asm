; DESCRIPTION: Renders a cyan line between points (296, 126) and (414, 168).
; PLAN: r0=296(x1), r1=126(y1), r2=414(x2), r3=168(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 126
LDI r2, 414
LDI r3, 168
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
