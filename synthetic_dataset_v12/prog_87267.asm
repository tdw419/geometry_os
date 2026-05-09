; DESCRIPTION: Renders a green line between points (386, 215) and (0, 255).
; PLAN: r0=386(x1), r1=215(y1), r2=0(x2), r3=255(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 215
LDI r2, 0
LDI r3, 255
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
