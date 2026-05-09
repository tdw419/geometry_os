; DESCRIPTION: Renders a yellow line between points (399, 67) and (479, 68).
; PLAN: r0=399(x1), r1=67(y1), r2=479(x2), r3=68(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 67
LDI r2, 479
LDI r3, 68
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
