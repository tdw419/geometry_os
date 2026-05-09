; DESCRIPTION: Renders a magenta line between points (415, 5) and (365, 210).
; PLAN: r0=415(x1), r1=5(y1), r2=365(x2), r3=210(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 5
LDI r2, 365
LDI r3, 210
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
