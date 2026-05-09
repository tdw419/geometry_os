; DESCRIPTION: Renders a cyan line between points (49, 63) and (401, 69).
; PLAN: r0=49(x1), r1=63(y1), r2=401(x2), r3=69(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 63
LDI r2, 401
LDI r3, 69
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
