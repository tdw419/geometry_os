; DESCRIPTION: Renders a cyan line between points (60, 226) and (203, 103).
; PLAN: r0=60(x1), r1=226(y1), r2=203(x2), r3=103(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 226
LDI r2, 203
LDI r3, 103
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
