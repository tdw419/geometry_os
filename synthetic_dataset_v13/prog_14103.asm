; DESCRIPTION: Renders a green line between points (27, 111) and (202, 50).
; PLAN: r0=27(x1), r1=111(y1), r2=202(x2), r3=50(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 111
LDI r2, 202
LDI r3, 50
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
