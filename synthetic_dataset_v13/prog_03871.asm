; DESCRIPTION: Renders a cyan line between points (0, 129) and (258, 21).
; PLAN: r0=0(x1), r1=129(y1), r2=258(x2), r3=21(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 129
LDI r2, 258
LDI r3, 21
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
