; DESCRIPTION: Renders a white line between points (404, 30) and (164, 242).
; PLAN: r0=404(x1), r1=30(y1), r2=164(x2), r3=242(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 30
LDI r2, 164
LDI r3, 242
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
