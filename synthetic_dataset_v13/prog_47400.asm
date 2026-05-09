; DESCRIPTION: Renders a white disk with center (445, 146) and radius 57.
; PLAN: r0=445(x), r1=146(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 445
LDI r1, 146
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
