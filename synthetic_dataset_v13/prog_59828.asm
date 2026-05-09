; DESCRIPTION: Renders a cyan line between points (419, 154) and (25, 103).
; PLAN: r0=419(x1), r1=154(y1), r2=25(x2), r3=103(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 154
LDI r2, 25
LDI r3, 103
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
