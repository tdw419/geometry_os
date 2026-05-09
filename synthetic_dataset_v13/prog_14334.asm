; DESCRIPTION: Renders a white line between points (261, 131) and (494, 213).
; PLAN: r0=261(x1), r1=131(y1), r2=494(x2), r3=213(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 131
LDI r2, 494
LDI r3, 213
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
