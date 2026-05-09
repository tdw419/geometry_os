; DESCRIPTION: Renders a orange line between points (255, 39) and (269, 27).
; PLAN: r0=255(x1), r1=39(y1), r2=269(x2), r3=27(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 39
LDI r2, 269
LDI r3, 27
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
