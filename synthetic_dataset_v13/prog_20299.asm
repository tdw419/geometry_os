; DESCRIPTION: Renders a yellow line between points (375, 182) and (255, 213).
; PLAN: r0=375(x1), r1=182(y1), r2=255(x2), r3=213(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 182
LDI r2, 255
LDI r3, 213
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
