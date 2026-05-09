; DESCRIPTION: Renders a white line between points (20, 135) and (346, 83).
; PLAN: r0=20(x1), r1=135(y1), r2=346(x2), r3=83(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 135
LDI r2, 346
LDI r3, 83
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
