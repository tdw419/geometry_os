; DESCRIPTION: Renders a white line between points (336, 255) and (387, 113).
; PLAN: r0=336(x1), r1=255(y1), r2=387(x2), r3=113(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 255
LDI r2, 387
LDI r3, 113
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
