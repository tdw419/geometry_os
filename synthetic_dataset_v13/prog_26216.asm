; DESCRIPTION: Renders a white line between points (305, 168) and (41, 128).
; PLAN: r0=305(x1), r1=168(y1), r2=41(x2), r3=128(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 168
LDI r2, 41
LDI r3, 128
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
