; DESCRIPTION: Renders a cyan line between points (267, 217) and (397, 7).
; PLAN: r0=267(x1), r1=217(y1), r2=397(x2), r3=7(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 217
LDI r2, 397
LDI r3, 7
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
