; DESCRIPTION: Draws a red line from (267, 23) to (401, 27).
; PLAN: r0=267(x1), r1=23(y1), r2=401(x2), r3=27(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 23
LDI r2, 401
LDI r3, 27
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
