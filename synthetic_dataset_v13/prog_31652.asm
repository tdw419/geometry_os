; DESCRIPTION: Renders a cyan line between points (173, 167) and (446, 45).
; PLAN: r0=173(x1), r1=167(y1), r2=446(x2), r3=45(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 167
LDI r2, 446
LDI r3, 45
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
