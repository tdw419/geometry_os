; DESCRIPTION: Renders a cyan line between points (503, 48) and (291, 187).
; PLAN: r0=503(x1), r1=48(y1), r2=291(x2), r3=187(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 48
LDI r2, 291
LDI r3, 187
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
