; DESCRIPTION: Renders a cyan line between points (59, 133) and (353, 125).
; PLAN: r0=59(x1), r1=133(y1), r2=353(x2), r3=125(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 133
LDI r2, 353
LDI r3, 125
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
