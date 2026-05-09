; DESCRIPTION: Draws a green line from (401, 117) to (304, 134).
; PLAN: r0=401(x1), r1=117(y1), r2=304(x2), r3=134(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 117
LDI r2, 304
LDI r3, 134
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
