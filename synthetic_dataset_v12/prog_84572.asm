; DESCRIPTION: Renders a red line between points (239, 29) and (143, 215).
; PLAN: r0=239(x1), r1=29(y1), r2=143(x2), r3=215(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 29
LDI r2, 143
LDI r3, 215
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
