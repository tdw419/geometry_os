; DESCRIPTION: Renders a cyan line between points (75, 203) and (383, 204).
; PLAN: r0=75(x1), r1=203(y1), r2=383(x2), r3=204(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 203
LDI r2, 383
LDI r3, 204
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
