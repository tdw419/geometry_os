; DESCRIPTION: Renders a cyan line between points (214, 234) and (205, 87).
; PLAN: r0=214(x1), r1=234(y1), r2=205(x2), r3=87(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 234
LDI r2, 205
LDI r3, 87
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
