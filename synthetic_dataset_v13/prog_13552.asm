; DESCRIPTION: Renders a white line between points (480, 219) and (446, 12).
; PLAN: r0=480(x1), r1=219(y1), r2=446(x2), r3=12(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 219
LDI r2, 446
LDI r3, 12
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
