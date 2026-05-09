; DESCRIPTION: Renders a white line between points (255, 197) and (21, 7).
; PLAN: r0=255(x1), r1=197(y1), r2=21(x2), r3=7(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 197
LDI r2, 21
LDI r3, 7
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
