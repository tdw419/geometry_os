; DESCRIPTION: Renders a red line between points (346, 143) and (322, 243).
; PLAN: r0=346(x1), r1=143(y1), r2=322(x2), r3=243(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 143
LDI r2, 322
LDI r3, 243
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
