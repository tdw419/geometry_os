; DESCRIPTION: Renders a white line between points (386, 154) and (407, 73).
; PLAN: r0=386(x1), r1=154(y1), r2=407(x2), r3=73(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 154
LDI r2, 407
LDI r3, 73
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
