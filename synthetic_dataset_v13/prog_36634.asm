; DESCRIPTION: Renders a green line between points (304, 161) and (154, 125).
; PLAN: r0=304(x1), r1=161(y1), r2=154(x2), r3=125(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 161
LDI r2, 154
LDI r3, 125
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
