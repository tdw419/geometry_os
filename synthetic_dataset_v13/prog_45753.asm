; DESCRIPTION: Renders a green line between points (4, 228) and (460, 104).
; PLAN: r0=4(x1), r1=228(y1), r2=460(x2), r3=104(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 228
LDI r2, 460
LDI r3, 104
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
