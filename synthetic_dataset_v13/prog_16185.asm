; DESCRIPTION: Renders a green line between points (261, 154) and (394, 57).
; PLAN: r0=261(x1), r1=154(y1), r2=394(x2), r3=57(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 154
LDI r2, 394
LDI r3, 57
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
