; DESCRIPTION: Renders a white line between points (255, 253) and (213, 38).
; PLAN: r0=255(x1), r1=253(y1), r2=213(x2), r3=38(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 253
LDI r2, 213
LDI r3, 38
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
