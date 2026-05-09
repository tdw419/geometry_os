; DESCRIPTION: Renders a cyan line between points (510, 170) and (403, 27).
; PLAN: r0=510(x1), r1=170(y1), r2=403(x2), r3=27(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 170
LDI r2, 403
LDI r3, 27
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
