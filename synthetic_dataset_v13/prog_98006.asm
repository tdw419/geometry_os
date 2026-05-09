; DESCRIPTION: Draws a cyan line from (485, 207) to (267, 57).
; PLAN: r0=485(x1), r1=207(y1), r2=267(x2), r3=57(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 207
LDI r2, 267
LDI r3, 57
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
