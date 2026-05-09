; DESCRIPTION: Renders a green line between points (42, 210) and (180, 84).
; PLAN: r0=42(x1), r1=210(y1), r2=180(x2), r3=84(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 210
LDI r2, 180
LDI r3, 84
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
