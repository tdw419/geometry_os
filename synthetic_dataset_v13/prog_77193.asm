; DESCRIPTION: Renders a green line between points (307, 195) and (129, 146).
; PLAN: r0=307(x1), r1=195(y1), r2=129(x2), r3=146(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 195
LDI r2, 129
LDI r3, 146
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
