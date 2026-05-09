; DESCRIPTION: Renders a white line between points (386, 135) and (294, 45).
; PLAN: r0=386(x1), r1=135(y1), r2=294(x2), r3=45(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 135
LDI r2, 294
LDI r3, 45
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
