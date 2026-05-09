; DESCRIPTION: Renders a green line between points (397, 111) and (74, 39).
; PLAN: r0=397(x1), r1=111(y1), r2=74(x2), r3=39(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 111
LDI r2, 74
LDI r3, 39
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
