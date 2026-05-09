; DESCRIPTION: Renders a cyan line between points (371, 68) and (510, 227).
; PLAN: r0=371(x1), r1=68(y1), r2=510(x2), r3=227(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 68
LDI r2, 510
LDI r3, 227
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
