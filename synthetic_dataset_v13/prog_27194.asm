; DESCRIPTION: Renders a cyan line between points (275, 135) and (323, 113).
; PLAN: r0=275(x1), r1=135(y1), r2=323(x2), r3=113(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 135
LDI r2, 323
LDI r3, 113
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
