; DESCRIPTION: Renders a cyan line between points (401, 27) and (333, 73).
; PLAN: r0=401(x1), r1=27(y1), r2=333(x2), r3=73(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 27
LDI r2, 333
LDI r3, 73
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
