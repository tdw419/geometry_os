; DESCRIPTION: Renders a cyan line between points (217, 194) and (178, 48).
; PLAN: r0=217(x1), r1=194(y1), r2=178(x2), r3=48(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 194
LDI r2, 178
LDI r3, 48
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
