; DESCRIPTION: Renders a cyan line between points (401, 29) and (304, 249).
; PLAN: r0=401(x1), r1=29(y1), r2=304(x2), r3=249(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 29
LDI r2, 304
LDI r3, 249
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
