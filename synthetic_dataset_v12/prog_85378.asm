; DESCRIPTION: Renders a cyan line between points (63, 139) and (239, 132).
; PLAN: r0=63(x1), r1=139(y1), r2=239(x2), r3=132(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 139
LDI r2, 239
LDI r3, 132
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
