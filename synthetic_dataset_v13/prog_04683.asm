; DESCRIPTION: Renders a magenta line between points (488, 14) and (240, 213).
; PLAN: r0=488(x1), r1=14(y1), r2=240(x2), r3=213(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 14
LDI r2, 240
LDI r3, 213
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
