; DESCRIPTION: Renders a white line between points (346, 206) and (426, 164).
; PLAN: r0=346(x1), r1=206(y1), r2=426(x2), r3=164(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 206
LDI r2, 426
LDI r3, 164
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
