; DESCRIPTION: Renders a white line between points (446, 168) and (168, 0).
; PLAN: r0=446(x1), r1=168(y1), r2=168(x2), r3=0(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 168
LDI r2, 168
LDI r3, 0
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
