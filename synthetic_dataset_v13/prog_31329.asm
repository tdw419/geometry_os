; DESCRIPTION: Renders a black line between points (262, 69) and (171, 243).
; PLAN: r0=262(x1), r1=69(y1), r2=171(x2), r3=243(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 69
LDI r2, 171
LDI r3, 243
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
