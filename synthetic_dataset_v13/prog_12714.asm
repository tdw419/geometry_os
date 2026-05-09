; DESCRIPTION: Renders a red line between points (401, 197) and (21, 168).
; PLAN: r0=401(x1), r1=197(y1), r2=21(x2), r3=168(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 197
LDI r2, 21
LDI r3, 168
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
