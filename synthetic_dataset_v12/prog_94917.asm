; DESCRIPTION: Renders a cyan line between points (294, 38) and (247, 67).
; PLAN: r0=294(x1), r1=38(y1), r2=247(x2), r3=67(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 38
LDI r2, 247
LDI r3, 67
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
