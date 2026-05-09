; DESCRIPTION: Renders a cyan line between points (414, 92) and (397, 210).
; PLAN: r0=414(x1), r1=92(y1), r2=397(x2), r3=210(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 92
LDI r2, 397
LDI r3, 210
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
