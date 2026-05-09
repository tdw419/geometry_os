; DESCRIPTION: Renders a magenta line between points (494, 70) and (126, 213).
; PLAN: r0=494(x1), r1=70(y1), r2=126(x2), r3=213(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 70
LDI r2, 126
LDI r3, 213
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
