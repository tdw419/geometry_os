; DESCRIPTION: Renders a cyan line between points (126, 214) and (421, 235).
; PLAN: r0=126(x1), r1=214(y1), r2=421(x2), r3=235(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 214
LDI r2, 421
LDI r3, 235
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
