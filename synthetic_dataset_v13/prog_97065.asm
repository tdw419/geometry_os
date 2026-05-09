; DESCRIPTION: Renders a orange line between points (460, 53) and (215, 143).
; PLAN: r0=460(x1), r1=53(y1), r2=215(x2), r3=143(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 53
LDI r2, 215
LDI r3, 143
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
