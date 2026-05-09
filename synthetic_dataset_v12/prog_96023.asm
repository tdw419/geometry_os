; DESCRIPTION: Draws a red line from (64, 215) to (18, 134).
; PLAN: r0=64(x1), r1=215(y1), r2=18(x2), r3=134(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 215
LDI r2, 18
LDI r3, 134
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
