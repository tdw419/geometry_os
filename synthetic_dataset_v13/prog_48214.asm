; DESCRIPTION: Renders a cyan line between points (173, 207) and (264, 10).
; PLAN: r0=173(x1), r1=207(y1), r2=264(x2), r3=10(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 207
LDI r2, 264
LDI r3, 10
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
