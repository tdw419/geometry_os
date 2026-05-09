; DESCRIPTION: Renders a cyan line between points (138, 5) and (405, 64).
; PLAN: r0=138(x1), r1=5(y1), r2=405(x2), r3=64(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 5
LDI r2, 405
LDI r3, 64
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
