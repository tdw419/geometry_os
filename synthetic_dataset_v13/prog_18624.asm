; DESCRIPTION: Renders a blue line between points (113, 111) and (380, 125).
; PLAN: r0=113(x1), r1=111(y1), r2=380(x2), r3=125(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 111
LDI r2, 380
LDI r3, 125
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
