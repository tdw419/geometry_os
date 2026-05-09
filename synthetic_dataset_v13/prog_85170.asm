; DESCRIPTION: Renders a orange line between points (259, 184) and (480, 228).
; PLAN: r0=259(x1), r1=184(y1), r2=480(x2), r3=228(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 184
LDI r2, 480
LDI r3, 228
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
