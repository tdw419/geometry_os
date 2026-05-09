; DESCRIPTION: Renders a red line between points (415, 178) and (164, 173).
; PLAN: r0=415(x1), r1=178(y1), r2=164(x2), r3=173(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 178
LDI r2, 164
LDI r3, 173
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
