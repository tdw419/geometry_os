; DESCRIPTION: Renders a green line between points (381, 111) and (480, 223).
; PLAN: r0=381(x1), r1=111(y1), r2=480(x2), r3=223(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 111
LDI r2, 480
LDI r3, 223
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
