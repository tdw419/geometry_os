; DESCRIPTION: Renders a cyan line between points (426, 82) and (480, 9).
; PLAN: r0=426(x1), r1=82(y1), r2=480(x2), r3=9(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 82
LDI r2, 480
LDI r3, 9
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
