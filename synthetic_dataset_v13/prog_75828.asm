; DESCRIPTION: Renders a cyan line between points (497, 228) and (43, 142).
; PLAN: r0=497(x1), r1=228(y1), r2=43(x2), r3=142(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 228
LDI r2, 43
LDI r3, 142
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
