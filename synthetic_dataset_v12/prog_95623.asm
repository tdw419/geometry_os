; DESCRIPTION: Renders a red line between points (217, 152) and (480, 142).
; PLAN: r0=217(x1), r1=152(y1), r2=480(x2), r3=142(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 152
LDI r2, 480
LDI r3, 142
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
