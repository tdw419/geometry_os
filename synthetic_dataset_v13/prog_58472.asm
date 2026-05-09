; DESCRIPTION: Renders a cyan line between points (438, 160) and (348, 126).
; PLAN: r0=438(x1), r1=160(y1), r2=348(x2), r3=126(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 160
LDI r2, 348
LDI r3, 126
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
