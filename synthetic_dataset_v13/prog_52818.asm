; DESCRIPTION: Renders a magenta line between points (504, 93) and (305, 117).
; PLAN: r0=504(x1), r1=93(y1), r2=305(x2), r3=117(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 93
LDI r2, 305
LDI r3, 117
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
