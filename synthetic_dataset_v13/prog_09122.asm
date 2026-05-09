; DESCRIPTION: Renders a white line between points (415, 130) and (445, 96).
; PLAN: r0=415(x1), r1=130(y1), r2=445(x2), r3=96(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 130
LDI r2, 445
LDI r3, 96
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
