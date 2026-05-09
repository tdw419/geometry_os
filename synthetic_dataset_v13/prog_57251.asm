; DESCRIPTION: Renders a white line between points (146, 209) and (288, 47).
; PLAN: r0=146(x1), r1=209(y1), r2=288(x2), r3=47(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 209
LDI r2, 288
LDI r3, 47
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
