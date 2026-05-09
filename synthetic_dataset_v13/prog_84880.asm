; DESCRIPTION: Renders a cyan line between points (459, 69) and (240, 240).
; PLAN: r0=459(x1), r1=69(y1), r2=240(x2), r3=240(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 69
LDI r2, 240
LDI r3, 240
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
