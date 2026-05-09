; DESCRIPTION: Renders a cyan line between points (403, 139) and (404, 28).
; PLAN: r0=403(x1), r1=139(y1), r2=404(x2), r3=28(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 139
LDI r2, 404
LDI r3, 28
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
