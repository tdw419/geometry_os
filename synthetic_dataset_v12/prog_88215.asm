; DESCRIPTION: Renders a cyan line between points (28, 240) and (291, 173).
; PLAN: r0=28(x1), r1=240(y1), r2=291(x2), r3=173(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 240
LDI r2, 291
LDI r3, 173
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
