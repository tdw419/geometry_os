; DESCRIPTION: Renders a cyan line between points (50, 157) and (277, 142).
; PLAN: r0=50(x1), r1=157(y1), r2=277(x2), r3=142(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 157
LDI r2, 277
LDI r3, 142
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
