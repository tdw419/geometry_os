; DESCRIPTION: Renders a green line between points (460, 221) and (57, 183).
; PLAN: r0=460(x1), r1=221(y1), r2=57(x2), r3=183(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 221
LDI r2, 57
LDI r3, 183
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
