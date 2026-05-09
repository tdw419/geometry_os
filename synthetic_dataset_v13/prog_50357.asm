; DESCRIPTION: Renders a green line between points (16, 210) and (217, 38).
; PLAN: r0=16(x1), r1=210(y1), r2=217(x2), r3=38(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 210
LDI r2, 217
LDI r3, 38
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
