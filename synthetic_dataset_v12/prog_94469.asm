; DESCRIPTION: Renders a cyan line between points (296, 249) and (65, 27).
; PLAN: r0=296(x1), r1=249(y1), r2=65(x2), r3=27(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 249
LDI r2, 65
LDI r3, 27
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
