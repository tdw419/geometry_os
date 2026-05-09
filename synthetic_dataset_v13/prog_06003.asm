; DESCRIPTION: Renders a cyan line between points (442, 53) and (401, 2).
; PLAN: r0=442(x1), r1=53(y1), r2=401(x2), r3=2(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 53
LDI r2, 401
LDI r3, 2
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
