; DESCRIPTION: Renders a cyan line between points (310, 108) and (117, 117).
; PLAN: r0=310(x1), r1=108(y1), r2=117(x2), r3=117(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 108
LDI r2, 117
LDI r3, 117
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
