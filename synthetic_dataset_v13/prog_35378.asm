; DESCRIPTION: Renders a cyan line between points (239, 111) and (345, 54).
; PLAN: r0=239(x1), r1=111(y1), r2=345(x2), r3=54(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 111
LDI r2, 345
LDI r3, 54
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
