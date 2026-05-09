; DESCRIPTION: Renders a cyan line between points (113, 104) and (209, 217).
; PLAN: r0=113(x1), r1=104(y1), r2=209(x2), r3=217(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 104
LDI r2, 209
LDI r3, 217
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
