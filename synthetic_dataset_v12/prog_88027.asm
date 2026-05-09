; DESCRIPTION: Renders a cyan line between points (299, 54) and (394, 248).
; PLAN: r0=299(x1), r1=54(y1), r2=394(x2), r3=248(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 54
LDI r2, 394
LDI r3, 248
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
