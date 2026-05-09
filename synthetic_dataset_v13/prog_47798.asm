; DESCRIPTION: Draws a cyan line from (401, 16) to (178, 53).
; PLAN: r0=401(x1), r1=16(y1), r2=178(x2), r3=53(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 16
LDI r2, 178
LDI r3, 53
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
