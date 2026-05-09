; DESCRIPTION: Renders a white line between points (197, 146) and (262, 151).
; PLAN: r0=197(x1), r1=146(y1), r2=262(x2), r3=151(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 146
LDI r2, 262
LDI r3, 151
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
