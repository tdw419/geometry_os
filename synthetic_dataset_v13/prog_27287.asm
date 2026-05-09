; DESCRIPTION: Renders a red line between points (221, 175) and (398, 113).
; PLAN: r0=221(x1), r1=175(y1), r2=398(x2), r3=113(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 175
LDI r2, 398
LDI r3, 113
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
