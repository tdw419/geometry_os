; DESCRIPTION: Renders a white line between points (294, 168) and (506, 240).
; PLAN: r0=294(x1), r1=168(y1), r2=506(x2), r3=240(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 168
LDI r2, 506
LDI r3, 240
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
