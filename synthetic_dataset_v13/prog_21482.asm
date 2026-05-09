; DESCRIPTION: Places a cyan line segment connecting (500, 42) to (404, 227).
; PLAN: r0=500(x1), r1=42(y1), r2=404(x2), r3=227(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 42
LDI r2, 404
LDI r3, 227
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
