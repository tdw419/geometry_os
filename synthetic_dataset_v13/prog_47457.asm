; DESCRIPTION: Renders a cyan line between points (428, 167) and (173, 100).
; PLAN: r0=428(x1), r1=167(y1), r2=173(x2), r3=100(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 167
LDI r2, 173
LDI r3, 100
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
