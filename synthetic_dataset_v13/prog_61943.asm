; DESCRIPTION: Renders a cyan line between points (239, 167) and (13, 210).
; PLAN: r0=239(x1), r1=167(y1), r2=13(x2), r3=210(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 167
LDI r2, 13
LDI r3, 210
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
