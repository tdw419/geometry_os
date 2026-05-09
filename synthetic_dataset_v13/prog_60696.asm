; DESCRIPTION: Renders a cyan line between points (74, 83) and (480, 239).
; PLAN: r0=74(x1), r1=83(y1), r2=480(x2), r3=239(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 83
LDI r2, 480
LDI r3, 239
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
