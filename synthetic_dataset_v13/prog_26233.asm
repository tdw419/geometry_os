; DESCRIPTION: Draws a white line from (345, 144) to (401, 190).
; PLAN: r0=345(x1), r1=144(y1), r2=401(x2), r3=190(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 144
LDI r2, 401
LDI r3, 190
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
