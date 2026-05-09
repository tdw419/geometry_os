; DESCRIPTION: Draws a cyan line from (304, 238) to (168, 69).
; PLAN: r0=304(x1), r1=238(y1), r2=168(x2), r3=69(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 238
LDI r2, 168
LDI r3, 69
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
