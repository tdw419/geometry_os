; DESCRIPTION: Renders a yellow line between points (8, 239) and (479, 18).
; PLAN: r0=8(x1), r1=239(y1), r2=479(x2), r3=18(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 239
LDI r2, 479
LDI r3, 18
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
