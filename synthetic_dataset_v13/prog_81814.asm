; DESCRIPTION: Renders a white line between points (92, 43) and (386, 60).
; PLAN: r0=92(x1), r1=43(y1), r2=386(x2), r3=60(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 43
LDI r2, 386
LDI r3, 60
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
