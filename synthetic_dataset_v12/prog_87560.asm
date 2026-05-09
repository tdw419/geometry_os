; DESCRIPTION: Renders a cyan line between points (3, 166) and (371, 63).
; PLAN: r0=3(x1), r1=166(y1), r2=371(x2), r3=63(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 166
LDI r2, 371
LDI r3, 63
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
