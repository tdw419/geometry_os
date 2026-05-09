; DESCRIPTION: Renders a cyan line between points (304, 38) and (435, 27).
; PLAN: r0=304(x1), r1=38(y1), r2=435(x2), r3=27(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 38
LDI r2, 435
LDI r3, 27
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
