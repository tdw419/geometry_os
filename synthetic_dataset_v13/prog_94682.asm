; DESCRIPTION: Renders a red line between points (146, 209) and (480, 110).
; PLAN: r0=146(x1), r1=209(y1), r2=480(x2), r3=110(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 209
LDI r2, 480
LDI r3, 110
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
