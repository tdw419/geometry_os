; DESCRIPTION: Renders a cyan line between points (411, 205) and (262, 69).
; PLAN: r0=411(x1), r1=205(y1), r2=262(x2), r3=69(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 205
LDI r2, 262
LDI r3, 69
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
