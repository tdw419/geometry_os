; DESCRIPTION: Renders a cyan line between points (214, 244) and (151, 109).
; PLAN: r0=214(x1), r1=244(y1), r2=151(x2), r3=109(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 244
LDI r2, 151
LDI r3, 109
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
