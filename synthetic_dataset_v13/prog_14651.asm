; DESCRIPTION: Renders a cyan line between points (108, 111) and (99, 125).
; PLAN: r0=108(x1), r1=111(y1), r2=99(x2), r3=125(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 111
LDI r2, 99
LDI r3, 125
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
