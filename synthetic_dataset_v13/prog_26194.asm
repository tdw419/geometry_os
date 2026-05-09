; DESCRIPTION: Places a cyan line segment connecting (168, 139) to (499, 168).
; PLAN: r0=168(x1), r1=139(y1), r2=499(x2), r3=168(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 139
LDI r2, 499
LDI r3, 168
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
