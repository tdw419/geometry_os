; DESCRIPTION: Draws a cyan line from (156, 210) to (401, 102).
; PLAN: r0=156(x1), r1=210(y1), r2=401(x2), r3=102(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 210
LDI r2, 401
LDI r3, 102
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
