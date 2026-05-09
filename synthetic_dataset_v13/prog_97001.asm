; DESCRIPTION: Renders a blue line between points (307, 228) and (298, 107).
; PLAN: r0=307(x1), r1=228(y1), r2=298(x2), r3=107(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 228
LDI r2, 298
LDI r3, 107
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
